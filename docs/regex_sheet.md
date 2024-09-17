# Change to conditional

[MSBuild best practices](https://learn.microsoft.com/en-us/visualstudio/msbuild/msbuild-best-practices?view=vs-2022)

```xml
<MyProperty Condition="'$(MyProperty)' == ''">
   MyDefaultValue
</MyProperty>
```
## Ecma expression

### Regex

```
<([0-9a-zA-Z_]+)>
```

### Replace

```
<$1 Condition="'$($1)' == ''">
```

## Example

### Before

```
<PackageId>$(AssemblyName)</PackageId>
```

### After

```
<PackageId Condition="'$(PackageId)' == ''">$(AssemblyName)</PackageId>
```