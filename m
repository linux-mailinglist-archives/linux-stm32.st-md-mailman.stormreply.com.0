Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615684C626
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 09:26:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D532AC71285;
	Wed,  7 Feb 2024 08:26:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7C65C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Feb 2024 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707158586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNq6oubwXmqe6ItjQ33y0Ud8zzbj1+GnKVYTNf0QWt4=;
 b=LDCODIf9ltZ3tRdTQPs5OvjJ9JL43He9NN9YqsGnbJtT6u/qL5S3ZMpQ0HD79pWk4AbMSW
 OJIZG+zxzO71W5CApXODc7rJ61/FGwjhpExp16DjTzBUH8aJmqcLEIWZoBgufcogbkxFii
 oo/awuUIvYCHYJXvOPUT3QjGUufmV4A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-HVIZDcqNNR6WrHzV4OC1DQ-1; Mon, 05 Feb 2024 13:43:05 -0500
X-MC-Unique: HVIZDcqNNR6WrHzV4OC1DQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a26f2da3c7bso275923466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Feb 2024 10:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707158584; x=1707763384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LNq6oubwXmqe6ItjQ33y0Ud8zzbj1+GnKVYTNf0QWt4=;
 b=o1rUlSa8okVOt3EcuscVapLb9b73WXkKMo8lr+VytRpYiYsFZ6vO6yZN+q6zWSZRzX
 q55YR2uRPoh63zfuKOtDKBI8FYpG1Gvvs0X6SYcrRoGELQnd48N9ITW++78zTOIzvIwD
 tIxo5WiQ6yJ84pt/bOfy8JkVxjYzqcjfEtq+bzT0jcRRimqOiUxStoh5eJ+GSiMumQSu
 KdFeOQZ3wABkXNnttt9gKT2bSZSgvMipkQJS6+oFMgrS2QejKKo4XKJwkbng2RcIjHZC
 fL7KyxlSLm5sHpEKgsLqV7GOA4T3ry3XDBOiW2iqLPO6T7/0LxysC+JouGHId4yIhguD
 tLGw==
X-Gm-Message-State: AOJu0Yz3JpjqPFB5bo0GkMb7JpQi/VD3oDdz8GZfDm2M28smKlkBsq5X
 c68YmucNhwYxCZaE+FhHCCo8rZrX5vvMpVTI1d1QjIUKS8yw3QtQbC52sW90JtQ16NGNoTifqm7
 GAg5Q5JjEzJwUixTxVgmI8NXkH/gyndWZBwWHf/QE1Ii0D7zua/YNjWvwSdR0iX2BEjuOiRSYx5
 nR
X-Received: by 2002:a17:906:c291:b0:a32:b376:489d with SMTP id
 r17-20020a170906c29100b00a32b376489dmr228577ejz.21.1707158584056; 
 Mon, 05 Feb 2024 10:43:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBJJqi+E8gTHS8rAQpA+gl5qKoCPXD/0rXi7vARpqh0DWv7P2ivFSjS3co7lz7OUOuk2D9Nw==
X-Received: by 2002:a17:906:c291:b0:a32:b376:489d with SMTP id
 r17-20020a170906c29100b00a32b376489dmr228552ejz.21.1707158583686; 
 Mon, 05 Feb 2024 10:43:03 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW/539QzZ3CsCBd/dh6u4+Lu0RJ/lNp9RpJ+QdlVC2XRNNKX6VqeLJj50ZJA+N90OsJClBVsg5JNJx2ats/acge24t52SP1Khtr1Zb4g78xgsfghwaFLj1f6AJtfVo6O317uL1HzzNqXxmpy7ECqBJEptEIkKBxTFpYeMwuFd+BML/Xrojv2jMMXM9fitkLsKBmdYff02rTHIy1/9RYeW9KdA+vBiMMFajtXpJ9V3LInGlCjYjlUDdXOvBtO5I7hA45drv3aKenosx8u4UyB41Mz1PLz7aLENeuLx+D1O2uqJitQ5WY2/MWQsxC4hRsJLrtQSEiVEO//auoefGKYicIZXYmMBpZyobmMO+U5/AI7JRZNB4SrfhxFR3pafp6m1NPrmYlSeKc08AuIyTHk9ANC0tpyeniQJ3jCv+QnMgmLtM/kn+0P+/bRaYeDZ6d8IRlYLtr+o3sXelQ5sLfNPgIJKCnYmIVFOljcVjx7+ZUhFi0fAaUSSYmOH5KO46artcSjNhj82irK/HCSLEyg8UvWscGqbKXPwX22XgIsaFBiaZQJE98IoKW/FK5HPxvcKxRAW/5/iKxgZhKCM8KtX0dQCkHll57HIUiJSjrmPsVcn0ucLRS3jgg9lsPvnuDItmph5A4CJHwTnHeAe/8NIIZ8VBicJlP78Sc2dSEOj28GuudM2rMQLEK9T4bEzynKCV2zDJ0K6FcH+gAF302k7BBiiWiEivB
Received: from [192.168.0.159] (185-219-167-205-static.vivo.cz.
 [185.219.167.205]) by smtp.gmail.com with ESMTPSA id
 t26-20020a1709066bda00b00a353d1a19a9sm121768ejs.191.2024.02.05.10.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 10:43:03 -0800 (PST)
Message-ID: <afb2fc66-abb4-4010-8120-ada7a6881f89@redhat.com>
Date: Mon, 5 Feb 2024 19:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manu Bretelle <chantr4@gmail.com>, Jiri Olsa <olsajiri@gmail.com>
References: <cover.1706491398.git.dxu@dxuuu.xyz> <Zb12EZt0BAKOPBk/@surya>
 <Zb5QWCw3Tg26_MDa@krava> <Zb6Jt30bNcNhM6zR@surya>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <Zb6Jt30bNcNhM6zR@surya>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Feb 2024 08:26:35 +0000
Cc: fsverity@lists.linux.dev, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com,
 netfilter-devel@vger.kernel.org, memxor@gmail.com, coreteam@netfilter.org,
 Daniel Xu <dxu@dxuuu.xyz>, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, alan.maguire@oracle.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 0/3] Annotate kfuncs in
	.BTF_ids section
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2/3/24 19:45, Manu Bretelle wrote:
> On Sat, Feb 03, 2024 at 03:40:24PM +0100, Jiri Olsa wrote:
>> On Fri, Feb 02, 2024 at 03:09:05PM -0800, Manu Bretelle wrote:
>>> On Sun, Jan 28, 2024 at 06:24:05PM -0700, Daniel Xu wrote:
>>>> === Description ===
>>>>
>>>> This is a bpf-treewide change that annotates all kfuncs as such inside
>>>> .BTF_ids. This annotation eventually allows us to automatically generate
>>>> kfunc prototypes from bpftool.
>>>>
>>>> We store this metadata inside a yet-unused flags field inside struct
>>>> btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
>>>>
>>>> More details about the full chain of events are available in commit 3's
>>>> description.
>>>>
>>>> The accompanying pahole and bpftool changes can be viewed
>>>> here on these "frozen" branches [0][1].
>>>>
>>>> [0]: https://github.com/danobi/pahole/tree/kfunc_btf-v3-mailed
>>>> [1]: https://github.com/danobi/linux/tree/kfunc_bpftool-mailed
>>>
>>>
>>> I hit a similar issue to [0] on master
>>> 943b043aeecc ("selftests/bpf: Fix bench runner SIGSEGV")
>>>  when cross-compiling on x86_64 (LE) to s390x (BE).
>>> I do have CONFIG_DEBUG_INFO_BTF enable and the issue would not trigger if
>>> I disabled CONFIG_DEBUG_INFO_BTF (and with the fix mentioned in [0]).
>>>
>>> What seems to happen is that `tools/resolve_btfids` is ran in the context of the
>>> host endianess and if I printk before the WARN_ON:
>>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>>> index ef380e546952..a9ed7a1a4936 100644
>>>   --- a/kernel/bpf/btf.c
>>>   +++ b/kernel/bpf/btf.c
>>>   @@ -8128,6 +8128,7 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
>>>            * WARN() for initcall registrations that do not check errors.
>>>            */
>>>           if (!(kset->set->flags & BTF_SET8_KFUNCS)) {
>>>   +        printk("Flag 0x%08X, expected 0x%08X\n", kset->set->flags, BTF_SET8_KFUNCS);
>>>                   WARN_ON(!kset->owner);
>>>                   return -EINVAL;
>>>           }
>>>
>>> the boot logs would show:
>>>   Flag 0x01000000, expected 0x00000001
>>>
>>> The issue did not happen prior to
>>> 6f3189f38a3e ("bpf: treewide: Annotate BPF kfuncs in BTF")
>>> has only 0 was written before.
>>>
>>> It seems [1] will be addressing cross-compilation, but it did not fix it as is
>>> by just applying on top of master, so probably some of the changes will also need
>>> to be ported to `tools/include/linux/btf_ids.h`?
>>
>> the fix in [1] is fixing flags in set8's pairs, but not the global flags
>>
>> it looks like Viktor's fix should now also swap that as well? like in the
>> change below on top of Viktor's changes (untested)
>>
>> jirka
>>
>>
>> ---
>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
>> index d01603ef6283..c44d57fec390 100644
>> --- a/tools/bpf/resolve_btfids/main.c
>> +++ b/tools/bpf/resolve_btfids/main.c
>> @@ -706,6 +706,8 @@ static int sets_patch(struct object *obj)
>>  			 * correctly translate everything.
>>  			 */
>>  			if (need_bswap) {
>> +				set8->flags = bswap_32(set8->flags);
>> +
>>  				for (i = 0; i < cnt; i++) {
>>  					set8->pairs[i].flags =
>>  						bswap_32(set8->pairs[i].flags);
>>
> 
> That should work. Here are a few tests I ran:
> 
> $ md5sum /tmp/kbuild-s390x/vmlinux.*
> eb658e51e089f3c5b2c8909a29dc9997  /tmp/kbuild-s390x/vmlinux.a
> # plain vmlinux before running resolv_btfids (all 0s)
> ea907cd46a1a73b8276b5f2a82af00ca  /tmp/kbuild-s390x/vmlinux.before_resolv
> # x86_64 resolv_btfids on master without Viktor's patch
> 980a40c3a3ff563d1c2d1ebdd5071a23  /tmp/kbuild-s390x/vmlinux.resolv_native
> # x86_64 resolv_btfids on master with Viktor's patch
> b986d19e242719ebea41c578235da662  /tmp/kbuild-s390x/vmlinux.resolv_native_patch_viktor
> # x86_64 resolv_btfids on master with Viktor's patch and your suggested patch
> 4edd8752ff01129945bd442689b1927b  /tmp/kbuild-s390x/vmlinux.resolv_native_patch_viktor_patched
> # s390x resolv_btfids run with qemu-s390x-static
> 4edd8752ff01129945bd442689b1927b  /tmp/kbuild-s390x/vmlinux.resolv_s390x
> 
> 
> and some hexdiff of those binaries:
> 
> 
> # difference between master's native build and s390x build.... has byte swapping for set8 and others
> diff -ruN <(xxd /tmp/kbuild-s390x/vmlinux.resolv_s390x) <(xxd /tmp/kbuild-s390x/vmlinux.resolv_native) > diff_s390x_native.diff
> https://gist.github.com/chantra/c3d58637a08a6f7340953dc155bb18cc
> 
> # difference betwee Viktor's version and  s390x build.... squinting my eyes I only see the global set8 is missing
> diff -ruN <(xxd /tmp/kbuild-s390x/vmlinux.resolv_s390x) <(xxd /tmp/kbuild-s390x/vmlinux.resolv_native_patch_viktor) > diff_s390x_native_viktor.diff
> https://gist.github.com/chantra/61cfff02b456ae72d3c0161ce1897097

Thanks for the testing Manu!

Jiri's suggested fix is now a part of [1].

Viktor

[1] https://lore.kernel.org/bpf/cover.1707157553.git.vmalik@redhat.com/

> 
> Have a good weekend all!
> 
> Manu
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
