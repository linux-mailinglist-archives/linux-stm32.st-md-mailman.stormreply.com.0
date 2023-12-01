Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0278800EB0
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 16:39:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D241C6B47D;
	Fri,  1 Dec 2023 15:39:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D017C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 15:39:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C280DB82252;
 Fri,  1 Dec 2023 15:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBDDC433C7;
 Fri,  1 Dec 2023 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701445181;
 bh=V7WtW43roNI+kWQ1jgxoaFh9ZbnjwKeONNImrea0QOQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TRASJF6OIlc3u7XXuhbDaK4viFQJH7E7P4b0J4LqnZBm3T4XlnR3wBJcRPM9GJJO4
 4Y3WNVYM4egNGn7EKS+XOf7HsyIWWI1Ehnm+UycZlQSrC7GkVbPj/7oh4rYBe9Ht/3
 Q8rfJDaPym3mbS1oRuUcd7Vy4vu8MUT7Jlq0QsMl1UPCi5URZ2uu+0dCnh7/NJHdvr
 AOgvp6+9g5MBccZC9x5e2TXU8Eg2bC9bCY7IiiWlMjj1jU3MkU2p5RjuMLWiXpjfxN
 KoK0WQEMGg98VWuozPV8zRgNgzyxLI3luIXEVYj89SJnBDR6Vm0nnbrxcaIOf+rl7s
 FVxTlyu/GUKTA==
Message-ID: <179a4581-f7df-4eb1-ab67-8d65f856a2fe@kernel.org>
Date: Fri, 1 Dec 2023 16:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "Song, Yoong Siang" <yoong.siang.song@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Topel <bjorn@kernel.org>, "Karlsson, Magnus"
 <magnus.karlsson@intel.com>,
 "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andre Fredette <afredette@redhat.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <d4f99931-442c-4cd7-b3cf-80d8681a2986@kernel.org>
 <PH0PR11MB58306C2E50009A6E22F9DAD3D881A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <6569f71bad00d_138af5294d@willemb.c.googlers.com.notmuch>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <6569f71bad00d_138af5294d@willemb.c.googlers.com.notmuch>
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 0/3] xsk: TX metadata txtime
	support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 12/1/23 16:09, Willem de Bruijn wrote:
> Song, Yoong Siang wrote:
>> On Friday, December 1, 2023 6:46 PM, Jesper Dangaard Brouer <hawk@kernel.org> wrote:
>>> On 12/1/23 07:24, Song Yoong Siang wrote:
>>>> This series expands XDP TX metadata framework to include ETF HW offload.
>>>>
>>>> Changes since v1:
>>>> - rename Time-Based Scheduling (TBS) to Earliest TxTime First (ETF)
>>>> - rename launch-time to txtime
>>>>
>>>
>>> I strongly disagree with this renaming (sorry to disagree with Willem).
>>>
>>> The i210 and i225 chips call this LaunchTime in their programmers
>>> datasheets, and even in the driver code[1].
>>>
>>> Using this "txtime" name in the code is also confusing, because how can
>>> people reading the code know the difference between:
>>>   - tmo_request_timestamp and tmo_request_txtime
>>>
>>
>> Hi Jesper and Willem,
>>
>> How about using "launch_time" for the flag/variable and
>> "Earliest TxTime First" for the description/comments?
> 

I don't follow why you are calling the feature:
  - "Earliest TxTime First" (ETF).
  - AFAIK this just reference an qdisc name (that most don't know exists)


> I don't particularly care which term we use, as long as we're
> consistent. Especially, don't keep introducing new synonyms.
> 
> The fact that one happens to be one vendor's marketing term does not
> make it preferable, IMHO. On the contrary.
>

These kind of hardware features are defined as part of Time Sensitive
Networking (TSN).
I believe these TSN features are defined as part of IEEE 802.1Qbv (2015)
and according to Wikipedia[2] incorporated into IEEE 802.1Q.

[2] https://en.wikipedia.org/wiki/Time-Sensitive_Networking


> SO_TXTIME is in the ABI, and EDT has been used publicly in kernel
> patches and conference talks, e.g., Van Jacobson's Netdev 0x12
> keynote. Those are vendor agnostic commonly used terms.
> 

I agree that EDT (Earliest Departure Time) have become a thing and term
in our community.
We could associate this feature with this.
I do fear what hardware behavior will be it if I e.g. ask it to send a
packet 2 sec in the future on i225 which max support 1 sec.
Will hardware send it at 1 sec?
Because then I'm violating the *Earliest* Departure Time.


> But as long as Launch Time is not an Intel only trademark, fine to
> select that.

The IEEE 802.1Qbv is sometimes called Time-Aware Shaper (TAS), but I
don't like to for us to name this after this.  This features is simply
taking advantage of exposing one of the hardware building blocks
(controlling/setting packet "launch time") that can be used for
implementing a TAS.

I like the name "launch time" because it doesn't get easily confused
with other timestamps, and intuitively describes packet will be send at
a specific time (likely in future).

--Jesper
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
