Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD12A33EA8
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 13:01:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99854C78F6D;
	Thu, 13 Feb 2025 12:01:56 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99F1BC78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 12:01:49 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1739448108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRi2by4hF7BVnwNBoTgAL9CtmnTqhyTscqUsWMsbLkE=;
 b=gFnFW5UrQOTpQ94swvZhMjxhGMXUmdllUKHeuFDQK0Iv3lEv7WPpWaXIeU5VL+qcOcmSEn
 kGMFK7iK7mxHYqifI8t7JJaghZu2pWmuNoQZl0H/sS7hc2aAzfJY6uTiz/VUKKb7ufyDvV
 GekiQzi55/iKXCpEU4TxkCFiALIeyIQPOqcDMIikhz9AHKLpm+BCrMkwt7jpDMpW6HskPB
 hTRniWF9zZf9BG1JpYfgOZs2UR+ANvzHYViC0g9vGZOrDUFkZONfFBHYpZxzRzJbGw8yny
 M+2fk9vdaXEG3xtJ/5zxxLJkdMMQyeOe1ee5wJ8rxGbSPv4p9zhZC5qrn+aYNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1739448108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRi2by4hF7BVnwNBoTgAL9CtmnTqhyTscqUsWMsbLkE=;
 b=9+v/6FZN9iYWg8vy7Kso1fLjYJd3UKBNQLlk/DBk8uSIJsOASKi30BUOPU3IuSdJHsDXLY
 ZN2gspy0UDfIpSBw==
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>
In-Reply-To: <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
Date: Thu, 13 Feb 2025 13:01:46 +0100
Message-ID: <87cyfmnjdh.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 0/9] igc: Add support for
 Frame Preemption feature in IGC
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
Content-Type: multipart/mixed; boundary="===============8515077459113783863=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8515077459113783863==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu Feb 13 2025, Abdul Rahim, Faizal wrote:
> On 13/2/2025 6:01 am, Vladimir Oltean wrote:
>> On Mon, Feb 10, 2025 at 02:01:58AM -0500, Faizal Rahim wrote:
>>> Introduces support for the FPE feature in the IGC driver.
>>>
>>> The patches aligns with the upstream FPE API:
>>> https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.115=
6614-1-vladimir.oltean@nxp.com/
>>> https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.730=
54-1-vladimir.oltean@nxp.com/
>>>
>>> It builds upon earlier work:
>>> https://patchwork.kernel.org/project/netdevbpf/cover/20220520011538.109=
8888-1-vinicius.gomes@intel.com/
>>>
>>> The patch series adds the following functionalities to the IGC driver:
>>> a) Configure FPE using `ethtool --set-mm`.
>>> b) Display FPE settings via `ethtool --show-mm`.
>>> c) View FPE statistics using `ethtool --include-statistics --show-mm'.
>>> e) Enable preemptible/express queue with `fp`:
>>>     tc qdisc add ... root taprio \
>>>     fp E E P P
>>=20
>> Any reason why you are only enabling the preemptible traffic classes
>> with taprio, and not with mqprio as well? I see there will have to be
>> some work harmonizing igc's existing understanding of ring priorities
>> with what Kurt did in 9f3297511dae ("igc: Add MQPRIO offload support"),
>> and I was kind of expecting to see a proposal for that as part of this.
>>
>
> I was planning to enable fpe + mqprio separately since it requires extra=
=20
> effort to explore mqprio with preemptible rings, ring priorities, and=20
> testing to ensure it works properly and there are no regressions.

Well, my idea was to move the current mqprio offload implementation from
legacy TSN Tx mode to the normal TSN Tx mode. Then, taprio and mqprio
can share the same code (with or without fpe). I have a draft patch
ready for that. What do you think about it?

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmet3yoTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgvLKD/9OQPyBrZSv022P25tXUsH7EuBaRKfA
aeLF85hUvtWB9bw1NihFYJsALhL8ouo+CTO9pvlnFlsgtgiB14KLrjShhefXZfTI
Prjpei01Kyb2te+XqjCBmnrz5DriDwUQjDVSxd8WlfuFhm/FquQCp3fATF083LBZ
T7fIsaLnoehBkUj5oMTgFu9EGRD+Pdnq9pQT94pHVPfSc1azLAU8LXzsXqOuCelK
VkM40CJm5hZwRAQz+rl2C6ji7qAukJ7tof61Cj6c6i7jTZAvbZ52QOUlubYNUNsL
yh4fGcYxLIJDp6yZz05Nf3KuEISjRcpxlEQxZF9vcfgSFa8cgwAZdnFdAnG9RH5F
BnO6hhrtoqi9jmDjQbnnROdxeK1zELqhRNmWe7aa6USiiziLg6OHVKBeB9gGQ0B6
F5XuwQjdfb96Mewy4S67FxwN0Ze53X7cqmUfk5WLESArCxrN2LMTuwOCsfYbBgpc
NXeqyFzLrHtvb7nMZkONVsXSAYDqsQ+Q3Ms9DLOUh5+jvn9c8XPEJkNNoG0sQznS
HSGN81QFGjkDACF/D7eiWrA7e6NoJoPMOdeyruHj2ejkZH+0FFA+p7qrWvwytOEx
rT4GG3JqWLcEs/W/1KZbNf7yioJf+kPIxbS7TxBxy+W+dy8DhDA6cJNEspn6uhqw
mbELAM6QhMYsxg==
=HZMH
-----END PGP SIGNATURE-----
--=-=-=--

--===============8515077459113783863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8515077459113783863==--
