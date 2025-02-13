Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 893AAA34176
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 15:12:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38EE2C78F6D;
	Thu, 13 Feb 2025 14:12:47 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3939C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 14:12:39 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1739455957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BzW+SUPbkzmDCTtzGAbH75OVDoj0R1lG79nB7e2KUr8=;
 b=NKCF61zds30qngIyng+oc5y0lDPbl/kQvL/oPHzrRxyQdo0qUFGV3iUaHUI9pqAFxDBN0j
 8WxBzE7tYHvxVYcuStC9AIdYqKcuTP7iDB3hwZJ8rsavtdjMhMwXTtXOgmzV2ni0S/6zpc
 0nXOV5mbs2sY2X+swrupaNMzinYeYT/csqmFkzhLisp0Hqn4U9v6tNC46LsUoVXfwlkcVD
 +zWg4zrHq5LWSdjY5jcWKZcljSGQGncBHzFDm6EOkVl1TcIqaz5MbHrgsB4f4ARzrynwSd
 KwEDSUPSGHc3VBHXkwkFABtwUD05jpVtvbV3bqD4lLkINJr28B2kRhmsGtxamg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1739455957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BzW+SUPbkzmDCTtzGAbH75OVDoj0R1lG79nB7e2KUr8=;
 b=uTTjkpO/ZnaEGhucyOJmim3FeReC/SHMv/5yuThYmbR8aubDStcpBh4+GwNGlZpkQIoTTY
 Tokwx+8vylKv7GDQ==
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>
In-Reply-To: <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
Date: Thu, 13 Feb 2025 15:12:35 +0100
Message-ID: <877c5undbg.fsf@kurt.kurt.home>
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
Content-Type: multipart/mixed; boundary="===============2272229069588809581=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2272229069588809581==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Feb 13 2025, Abdul Rahim, Faizal wrote:
> On 13/2/2025 9:00 pm, Vladimir Oltean wrote:
>> On Thu, Feb 13, 2025 at 08:54:18PM +0800, Abdul Rahim, Faizal wrote:
>>>> Well, my idea was to move the current mqprio offload implementation fr=
om
>>>> legacy TSN Tx mode to the normal TSN Tx mode. Then, taprio and mqprio
>>>> can share the same code (with or without fpe). I have a draft patch
>>>> ready for that. What do you think about it?
>>>
>>> Hi Kurt,
>>>
>>> I=E2=80=99m okay with including it in this series and testing fpe + mqp=
rio, but I=E2=80=99m
>>> not sure if others might be concerned about adding different functional
>>> changes in this fpe series.
>>>
>>> Hi Vladimir,
>>> Any thoughts on this ?
>>=20
>> Well, what do you think of my split proposal from here, essentially
>> drawing the line for the first patch set at just ethtool mm?
>> https://lore.kernel.org/netdev/20250213110653.iqy5magn27jyfnwh@skbuf/
>>=20
>
> Honestly, after reconsidering, I=E2=80=99d prefer to keep the current ser=
ies as is=20
> (without Kurt=E2=80=99s patch), assuming you=E2=80=99re okay with enablin=
g mqprio + fpe=20
> later rather than at the same time as taprio + fpe. There likely won=E2=
=80=99t be=20
> any additional work needed for mqprio + fpe after Kurt=E2=80=99s patch is=
 accepted,=20
> since it will mostly reuse the taprio code flow.

I think so. After switching the Tx mode mqprio will basically be a
special case of taprio with a dummy Qbv schedule. Also the driver
currently rejects mqprio with hardware offloading and preemptible_tcs
set. So, I do not see any issues in merging your fpe series first. I can
handle the mqprio part afterwards.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmet/dMTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzguJiEACFtqLdMYECmeOz/p8OxgK9pkkB3GjE
/ne59xGsryfADF8D4kteIgxdZSEh/EFP7Rx3QFpoDLRtDYcjVzoQ7acJi+TlV50M
UalDx0SMG+0kbdtONmX7L0J5f6Z0PoMNwaF5skFbYqhkzai9Z9GK7B+OsNY8J/uQ
aSPAOrykNyHbqGH2MKsAfNRIhwO0HFIwZPxCFKvuc6He4uhNaoW+vOXmd/UMi6Ht
i7xQRrfR/D9e0oEKpbse2CDmsiQ1i5pC9xwyvMnCcfhsxZ+ERB1AG3IvP3pJn8Qk
P3jcsgqmQ2loVOli8ezx1DphWU5UJ4GacQcdgggwlhBYSBH2TnV8MQAFYIGlLycQ
EBY2NxIOY0UXfRA5+lDf3seCF7Os6T7R790hLo3ZWIVGPnkuXYLZYvDkJ/eD1Sm6
MM6p5IxpsrR6XhZnUu+mmHs8J8iUj4xN8zFUKwYuWjC+neCIsjLQJtP7wPANKPgi
0I2RXRut1MuSm7lrQMoD+n75oomFOqURsVm0WyrAiw7vAGNSsjqL1aIx0YIzHDs2
mOwt1mPgHd21wTjjNfDt4z6MhLh5DaTLqZ8xyYju57Oa97gtsDZLXbUfytxjWaFm
6+UOjgo/gCNday3bkXsvtrveLRdc+Ng6Ymb3bD5/M4cBO6K2irngg3R7uXXOB5Pm
t1avzPuL0QscCw==
=1mRZ
-----END PGP SIGNATURE-----
--=-=-=--

--===============2272229069588809581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2272229069588809581==--
