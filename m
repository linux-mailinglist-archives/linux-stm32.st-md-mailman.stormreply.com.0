Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EABCD81B02D
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 09:20:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3D26C6C841;
	Thu, 21 Dec 2023 08:20:21 +0000 (UTC)
Received: from sonic315-8.consmr.mail.gq1.yahoo.com
 (sonic315-8.consmr.mail.gq1.yahoo.com [98.137.65.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07488C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 07:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1703144440; bh=mg05y36DE7RxqcYS0Yg08PxNcX+uHQSyP8myVr6Z9SY=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From:Subject:Reply-To;
 b=P89LqL97iPvqOEygAP8jIsPZdMngoRwqUSc4npUBOQFiFGY3luRHEQLl7zdnk60r5eiAkuJ65HxLHV/QvjEjzQiKQ3YR09pxtJzu0S/SqVe62irq8ZQYCFWqnznCIJuUPA1X+4c35mBE8sCvrAETDIYEshAq+q3UkeUvmkOUuIKM7vVpiTP1C9SVA8OWKyjgZgkWzy/+rHCjt76FtOm1i1AKH1GtDhWYEiA5eSKc1fa46ZFd8ZYJHXC3xFw3LCwVEYeMxOhU+v5ut9eKZ7pvG05vPj2k+oidC2oCvz0s0gy4DaoPWs3UHiffdb1IXGSIHk6/rP7e6hpFP0/Ys+UMaw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1703144440; bh=bn6pI1tRgeo5pd9kjkdssNA1BveJ0C1MagLRtvwF3nw=;
 h=X-Sonic-MF:Subject:From:Date:To:From:Subject;
 b=It7cosj99/AVXTgXJhVRhXu147j60qbQD5XJY8Nvh6G+KfcRpgxmKIEtv7ECwUMiAHQTU+/f1jBvIppa9R6YbvRRN9mOo+4FQux/JbnxtajMtfYc9/zLarYVmGTWkqK2DV2t08v7p0+LI/w8qntcq28Yd8BxMbDGvQGRxFE+ntMLYE7h0P9RKJkrRjp62zxiciqdlOUPFZIIVbC0RK72cu84YGbcD0j5oA4P9Pd6EeoNB+UqJcd0IHJY9q4VUmk/3Yd2qVLZ2Ug+xlfvjKMVGBfORJTkj86rA1q6zu4MPGt1PXFl1Gavc2oQohIKqu1xTICEkuOSMBjcHIcxeIHsSA==
X-YMail-OSG: PAG3T28VM1nGfuDPV9.TECwvTjInXgMvQwaCMPmPJ6iCva9T.Qf6FVuEwvGMZlO
 1LKiVvCM0cFMgG6DpWTcDDwIwiL9n4Tjpa._Y_ThBXIaSY0NiVa12eObw.QLfjgSiq06lKsX6KNi
 maaeiGMStPqcCHcQddh4gQjOWoetAPU_sWocQBtnkLVkHgqs5Z94MuCqqBENEgF4TInKuOLFrEVl
 rPPPoL70dwUg_b_.PkKgFOi4iuzv__AfdpXJx_lopJSgqCGYJ.7SQVE3BOH9EtHKY1YS3fNSlKOZ
 hHZ9pQ9LCM_fxzEMYPNF8ZUdiLzohzy08SP09C3TXcCndhaPj3TLlEZAVJwF711gcWV1ODUzl3Nt
 vqbPw_2KDfGqyqX7IOkMvIaymI7lwv2ratRaM.98.DUqqXpJdApQUHPVVu.wPXyU4D6HG1YeoIJO
 6WNygVkskfCLdIhtljBwtObCNvdFJTCCitTZN7YXj0ebaI_5tMsvVYljObgmGv19.Y3yTbMBWBM9
 qjsddAZEQLLYc8p_v8J4lLuMzev8C8sWhyW6nmNGmOuDSc9KV23UbH.hh8ojlGapl5xmKdIF.t51
 Zat_pTSV1F8xUD7rZQk1hYz.s34Lew0zQq0B_9r5DSdBkuk7bLRINtZMgGjFP5yEUfXyUM5cdH7D
 7xIHIafIxwxwZZLmLArt3OvugYHs390oTJHkTK2Vrqqg_52F6f7pLlNnAEK.mOm0NS8RoGq5L56A
 .ApNen.PanGlzxMt266bki4ehmX1PdYkwdi4irJA62Op2SVpkKvNg2Gb2ca2kuloxqRyTQ2ikBtL
 2PqYA3iPYhUDl1GbH.2ooohO81oPedsFIHfJmAGqzJqifi5MXT2z6NRnJXaI1mo0074lvb3LBtQi
 Ymjh6rxUDSUv0yWzOjjhYgftNUNjwmarxw_0KQf312rs42WwP5l3qgWKZiUK50_btIGblokF_K1g
 abxK9Ye52MChv8i_o5oMpeQckiuWh.1gWGOHlJDFNewOzX8hO.fRTq1TA4U8hvLjuESFUG3JCoJ_
 CeowDJOGOz1oVp3Fwy4yvW.08p9uOCllPU6YJV1kcwsbIlFwfBSWa.kbSO5s3mcOhnmwLXUuHfsL
 nIsDs6yT7zFObHsKa5fdYmRZQH3QeWPd3UucXC8lVRkSQGdrP7RF0SAlaCV273JBGPWDyLgPuHXy
 cdVZD.vIm_7MQB8E3oHKXRW7ZrtvSxK33sjtJTY5.wdyjUD0vjpuxPjbNZrzwbBrRgUgvj.dvkQR
 RYnwNi4_YXGgqI8cPxjObzyC0X7irgVp.627SX6ur_.IuMmr7vtyYslKak0RIZcl03STKKl2W_BX
 u0KQGXNnSnaEI_xLGQIbnPud3Iyu_qx_qvmAM46.EAaWoeQgwioqOBzP5ZPmtEw4SlxITEANTpgy
 p4j8xbLseErASQV.Y7Cjs21lNtDe5o9nXskmdUTfwIb.4kqmv8G5GNQDgA.GmxooXSpIKzNOzWYs
 qdNTKL2aWTEAtsePcme6OSw1BbE5IHnfj51jRfL0BIQYjBFuqI92XawWuJ2XlbBT0q1Cxk6zf77O
 tuS5Zv5bzttZPzasW7WJ5YpSiBNa0_5_FKXN7Znnavcni0ERXlJ0pLTDxn9IapPFkow2wFZE8tEA
 YY.VIRaAolSK4qQJQp8PMb6y7YKpuF0_ZdNbsxnSX51AypLLD.RSMXX36CL3ufVWMQYiPrrilf_M
 McuF8mXKzQ2Z1fFS0sH5TOhrvWXEPDd8T7mdZYUVCy6Lo_OwIQFXJOFXYRv8P4.alp531gAO9LjD
 LCenYdGhB8ZQYx7KNEx6.RL0I6z5WRhOBxHX9A8g9LbeqSY3nRErv.h30Wh4Hfk9mcxm8RlIrwnr
 KTKzwgYOjOeVHHjZ9.9I9ew20FlZyWT4Mwx3jKf0I4eBYvw.x.1UY9V_KMuQ3CMWovvZHx6ykSjQ
 i1xnpfibWjkrjleteksmdWBumA3M9bRuzn6R7lc.Znt7eW0T8mdg7Gdw6ezJEWqG8NshDf3xkGe9
 ypJV09J5wM5U34SvPUL1XFrBzoR__JuAMS.o1F_2HcqOE50RToEUo6x0Jnd0AH_XswN3fV4VBpOn
 sCPs5wssfw_ozaD0DMTKhj7uw2DaN9mCGvoCPEfHavWbqFsFUt80I80Hb3wUP.wOZVq.sP_G3r0o
 8YnUxTAtLWoRDKs5D9ggAI_NB.j6wqqiI5xRtloQlk7tbP_Oulq7oIuAd3hgRYPnrOCX_y2GUUth
 XrAs0MsKHUHEkEepsxkgDBTzspTeOnCCC7jb1nSI-
X-Sonic-MF: <canghousehold@aol.com>
X-Sonic-ID: 74a468d9-748d-4e1e-91f8-922279871ff2
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Thu, 21 Dec 2023 07:40:40 +0000
Received: by hermes--production-bf1-6745f7c55c-6hpmf (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8eb59427d9a6f70ecffbb8b97d4ba1ed; 
 Thu, 21 Dec 2023 07:40:36 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
From: Household Cang <canghousehold@aol.com>
In-Reply-To: <20231218162326.173127-1-romain.gantois@bootlin.com>
Date: Thu, 21 Dec 2023 02:40:34 -0500
Message-Id: <0351C5C2-FEE2-4AED-84C8-9DCACCE4ED0A@aol.com>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Mailman-Approved-At: Thu, 21 Dec 2023 08:20:21 +0000
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/1] Prevent DSA tags from breaking COE
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Cgo+IE9uIERlYyAxOCwgMjAyMywgYXQgMTE6MjMgQU0sIFJvbWFpbiBHYW50b2lzIDxyb21haW4u
Z2FudG9pc0Bib290bGluLmNvbT4gd3JvdGU6Cj4gCj4gVGhpcyBpcyBhIGJ1Z2ZpeCBmb3IgYW4g
aXNzdWUgdGhhdCB3YXMgcmVjZW50bHkgYnJvdWdodCB1cCBpbiB0d28KPiByZXBvcnRzOgo+IAo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi9jNTcyODNlZC02YjliLWIwZTYtZWUxMi01
NjU1YzFjNTQ0OTVAYm9vdGxpbi5jb20vCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2
L2U1YzZjNzVmLTJkZmEtNGU1MC1hMWZiLTZiZjRjZGI2MTdjMkBlbGVjdHJvbWFnLmNvbS5hdS8K
PiAKQWRkIG1lIGluIHRvIGJlIHRoZSAzcmQgcmVwb3J0Li4uClJLMzU2OCBHTUFDMCAoZXRoMSkg
dG8gTVQ3NTMxQkUgKENQVSBwb3J0KQpDdXJyZW50IHdvcmthcm91bmQgZm9yIG1lIGlzIGV0aHRv
b2wgLUsgZXRoMSByeCBvZmYgdHggb2ZmCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYv
bTNjbGZ0Mms3dW1qdG55NTQ2b3QzYXllYmF0dGtzaWJ0eTN5eXR0cGZmdmRpeGw2NXBAN2RwcXNy
NW5pc2JrL1QvI3QKClF1ZXN0aW9uIG9uIHRoZSBwYXRjaCB0byBiZSBidWlsdDogaG93IHdvdWxk
IEkga25vdyBpZiBteSBzZXR1cCBjb3VsZCB0YWtlIGFkdmFudGFnZSBvZiB0aGUgSFcgY2hlY2tz
dW0gb2ZmbG9hZD8gUkszNjU44oCZcyBldGgwIG9uIHN0bW1hYyBpcyBkb2luZyBmaW5lLCBhbmQg
ZXRoMCBpcyBub3Qgb24gYSBEU0Egc3dpdGNoLiBEb2VzIHRoaXMgbWVhbiBldGgxIHNob3VsZCBi
ZSBhYmxlIHRvIGRvIGh3IGNoZWNrc3VtIG9mZmxvYWQgb25jZSB0aGUgc3RtbWFjIGRyaXZlciBp
cyBmaXhlZD8K4oCUTHVjYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
