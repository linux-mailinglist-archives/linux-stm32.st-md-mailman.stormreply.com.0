Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110279A0E0
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 02:54:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30E95C6B467;
	Mon, 11 Sep 2023 00:54:17 +0000 (UTC)
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com
 [162.62.58.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0BA5C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1694393647;
 bh=e8LKS8HhWPck1vDkqjPmHZxkx2PFdFGyX3j36KpKLfU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=lEt7B/6dm8+Z9Sh+AKs0zxa3d5FNHkTvLeqlJD7u89jd+eUlU2ZvlqgyRhsiD0JFO
 u6CWnsLGHkacmM6HwNIZ2OnZdXojmlBBt5PG1pQp8fdVgrW/6JAmhDJEMuwNcw6MxG
 56UADFcSaDhOahLuixP/r2P2Ije9CgPW9qs3v9zw=
Received: from [10.56.52.5] ([39.156.73.12])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id D7893C06; Mon, 11 Sep 2023 08:53:56 +0800
X-QQ-mid: xmsmtpt1694393636ts9e7hqu0
Message-ID: <tencent_D9D7A82E62964183904056D925804AFAAB06@qq.com>
X-QQ-XMAILINFO: NSObNE1Kae7ZV4zpWGwhbP6lKO+lg0unMDue1LQkeGCZ6nF23/wPukI3ziv4Fz
 2sWPgAatQMSWjSZP3N7dE6aVFdntR3GGSp2dIwZM1XFWQkSz8WYMgS8FAJ7KkhCb9YmqQ6jjj2pV
 ggKo3Q3qUzCKBey1nFvgGPB00SNJtNoiF9jYDtNI32Q1LWrGQWDZMVtTmpbNqMtD4m2fZJO3dHrP
 oz9PBvY3FY5gW+t0Mnz1ddhFf/vU0BnBCoMaFY8jFlReRDihNWI3+r01Sj1qL4TMp15a6K7jiJke
 9Bf+8vKAwc2hdaQ4734jIOgzBCGPeag+UGDkdTrWr1xRjmldQrB3bQQsC7nXxlkmtcC2sLk+tVKj
 vu8e4fSERVHRnRjyEaDL9pPWSM/hk/02jGManlVgu+1g214KRfnCWEQ5yx6uo2HAjsfxlAReJUBS
 thEsC6r5hpixO/3mpmW4OZ4aXd7PEDiz18L+ZGBml+wTbwuC8YlZDQSZgWufAzGusl2Uvt3IbqTN
 f4Q7lXihrpyPbaHYOIpr4Q2rBkk/YLsOYzZIx2424V6djlZbyVxCEjnm6HuzDV/XX9i5EaLqsobl
 jpjK8o8Nj5DPgvbeySwiKXdjuCW5R25Z6xK832Q1/Km9a/Oz2Z0ck13GeBFBUgS6CoZc89snOAPf
 fOQEZw7qgGvMLJTncCgMIQKl0d3xmET9nAd8sUACVsNCUWpUG8/6wG4o3Bzj0zjM85X1SPQw72mT
 /+D3ATEWc8VKg+YbHeeJCX35eMrdjhkg7W7MyttvfQDIvGPueRX0bswZT3aiaLP64JLlZv++edTu
 Gk4Vk8K/I+PDRVPF4y3t815rSIpmWKKTQlJxbxI5ikfa4c7F5jw9o20IcBLV5X3uYXSeUISnWYqE
 WDUi6Lpk23hjYcA7Vrxx3FMYsJAA64qCSaZZ7HvruxlrdeSPb3LuMuKAZFvlgfi9cPoo/ngvJHyD
 fbdDEdcRYaEwZR8CCiVhDJJpMZe7QeCkaNjNN+NFEZ7/en/9R5Oa/aILHJreB1
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-OQ-MSGID: <911f8229-2722-45f5-87e1-97afacbf7992@foxmail.com>
Date: Mon, 11 Sep 2023 08:53:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: patchwork-bot+netdevbpf@kernel.org
References: <tencent_FA47B711AB0DEC843EB3362E6355505ED509@qq.com>
 <169421642337.339.11184428489042288950.git-patchwork-notify@kernel.org>
From: Rong Tao <rtoax@foxmail.com>
In-Reply-To: <169421642337.339.11184428489042288950.git-patchwork-notify@kernel.org>
Cc: yonghong.song@linux.dev, song@kernel.org, laoar.shao@gmail.com,
 rongtao@cestc.cn, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, andrii@kernel.org, mcoquelin.stm32@gmail.com,
 ast@kernel.org, kpsingh@kernel.org, olsajiri@gmail.com,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, jolsa@kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev, sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v12 0/2] selftests/bpf: Optimize
	kallsyms cache
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
Content-Type: multipart/mixed; boundary="===============6500263378595240966=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============6500263378595240966==
Content-Type: multipart/alternative;
 boundary="------------aUyIJ6RSMy0MudapNv3Sn5q8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------aUyIJ6RSMy0MudapNv3Sn5q8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/23 7:40 AM, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
>
> This series was applied to bpf/bpf-next.git (master)
> by Andrii Nakryiko<andrii@kernel.org>:
>
> On Thu,  7 Sep 2023 09:59:12 +0800 you wrote:
>> From: Rong Tao<rongtao@cestc.cn>
>>
>> We need to optimize the kallsyms cache, including optimizations for the
>> number of symbols limit, and, some test cases add new kernel symbols
>> (such as testmods) and we need to refresh kallsyms (reload or refresh).
>>
>> Rong Tao (2):
>>    selftests/bpf: trace_helpers.c: optimize kallsyms cache
>>    selftests/bpf: trace_helpers.c: Add a global ksyms initialization
>>      mutex
>>
>> [...]
> Here is the summary with links:
>    - [bpf-next,v12,1/2] selftests/bpf: trace_helpers.c: optimize kallsyms cache
>      https://git.kernel.org/bpf/bpf-next/c/c698eaebdf47
>    - [bpf-next,v12,2/2] selftests/bpf: trace_helpers.c: Add a global ksyms initialization mutex
>      https://git.kernel.org/bpf/bpf-next/c/a28b1ba25934
>
> You are awesome, thank you!

Thanks, I just found that libbpf_ensure_mem() could optimize too, 
cap_cnt start from a big

number. I'll try it some day.

Rong Tao

--------------aUyIJ6RSMy0MudapNv3Sn5q8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/9/23 7:40 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:patchwork-bot+netdevbpf@kernel.org">patchwork-bot+netdevbpf@kernel.org</a> wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:169421642337.339.11184428489042288950.git-patchwork-notify@kernel.org">
      <pre class="moz-quote-pre" wrap="">Hello:

This series was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <a class="moz-txt-link-rfc2396E" href="mailto:andrii@kernel.org">&lt;andrii@kernel.org&gt;</a>:

On Thu,  7 Sep 2023 09:59:12 +0800 you wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Rong Tao <a class="moz-txt-link-rfc2396E" href="mailto:rongtao@cestc.cn">&lt;rongtao@cestc.cn&gt;</a>

We need to optimize the kallsyms cache, including optimizations for the
number of symbols limit, and, some test cases add new kernel symbols
(such as testmods) and we need to refresh kallsyms (reload or refresh).

Rong Tao (2):
  selftests/bpf: trace_helpers.c: optimize kallsyms cache
  selftests/bpf: trace_helpers.c: Add a global ksyms initialization
    mutex

[...]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Here is the summary with links:
  - [bpf-next,v12,1/2] selftests/bpf: trace_helpers.c: optimize kallsyms cache
    <a class="moz-txt-link-freetext" href="https://git.kernel.org/bpf/bpf-next/c/c698eaebdf47">https://git.kernel.org/bpf/bpf-next/c/c698eaebdf47</a>
  - [bpf-next,v12,2/2] selftests/bpf: trace_helpers.c: Add a global ksyms initialization mutex
    <a class="moz-txt-link-freetext" href="https://git.kernel.org/bpf/bpf-next/c/a28b1ba25934">https://git.kernel.org/bpf/bpf-next/c/a28b1ba25934</a>

You are awesome, thank you!</pre>
    </blockquote>
    <p>Thanks, I just found that libbpf_ensure_mem() could <span
      style="white-space: pre-wrap">optimize too, cap_cnt start from a big</span></p>
    <p><span style="white-space: pre-wrap">number. I'll try it some day. </span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Rong Tao
</span></p>
    <blockquote type="cite"
cite="mid:169421642337.339.11184428489042288950.git-patchwork-notify@kernel.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------aUyIJ6RSMy0MudapNv3Sn5q8--


--===============6500263378595240966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6500263378595240966==--

