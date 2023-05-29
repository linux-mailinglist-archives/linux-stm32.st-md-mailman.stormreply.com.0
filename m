Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4D714607
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 10:07:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CAC6C6A608;
	Mon, 29 May 2023 08:07:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74613C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 08:07:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34T1j4r8013586; Mon, 29 May 2023 10:07:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iJD4xsBkaQxyCxdKBwcnMTO5G+oQGyygLDr4AJFp+Ww=;
 b=G9yGL8x7zG5rQ5sKydCWpC0rxW/ClE+nCnbpp0Pllf1rqDFv/WFxRx5/QuGqBiW6FGny
 05fnCdun4yIb5razFWOaf/unAaVyblSw9VXw+xuxjK2LpDtsdvWcJAP07EzyaNcmU1aX
 i5Hp2rH0LTslp8v5L/rlq+2BFaIrWPPjB/epsp0k6R69PVN/Zrut0wc4b2T8s7ZB1Ra4
 5vParKUfLC9tbDR3qvWp/QtGODTc1dDdNJ8WVoHIQUFVy4rl5jUzZpr2We0vEJVilsRz
 nxOYFoyI8pnX/D0ZgAgB7rjeOc/4hwpiNrwXzx2AnMvtJC05E2bx0qgSQynOsae+48FX 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quakkrcay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 May 2023 10:07:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 659A910002A;
 Mon, 29 May 2023 10:07:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D9E4214D35;
 Mon, 29 May 2023 10:07:02 +0200 (CEST)
Received: from [10.252.27.228] (10.252.27.228) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 10:07:01 +0200
Message-ID: <cc6a1064-8b53-c63d-9592-92748b67639a@foss.st.com>
Date: Mon, 29 May 2023 10:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
 <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
 <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
 <5f201903-17cb-5054-763c-f03b1066db1d@denx.de>
 <32fafa74-8964-c9cf-f95b-f2cd084f46c6@foss.st.com>
 <b23ddf9e-6bba-68df-cf28-cc0e2c4218ac@denx.de>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <b23ddf9e-6bba-68df-cf28-cc0e2c4218ac@denx.de>
X-Originating-IP: [10.252.27.228]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_05,2023-05-25_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: fix several DT
 warnings on stm32mp15
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

Ck9uIDUvMjYvMjMgMTg6NTUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMjUvMjMgMTA6MTQs
IFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4KPiBIaSwKSGkgTWFyZWssCj4KPj4+IEkgdGhp
bmsgaWYgeW91IHJldGFpbiB0aGUgc3RtMzJtcDE1MS5kdHNpICZsdGRjIHsgcG9ydCB7ICNhZGRy
ZXNzLWNlbGxzID0gPDE+Owo+Pj4gI3NpemUtY2VsbHMgPSA8MD47IH07IH07IHBhcnQsIHRoZW4g
eW91IHdvdWxkbid0IGJlIGdldHRpbmcgYW55IHdhcm5pbmdzCj4+PiByZWdhcmRpbmcgTFREQyAs
IGFuZCB5b3Ugd291bGRuJ3QgaGF2ZSB0byByZW1vdmUgdGhlIHVuaXQtYWRkcmVzcyBmcm9tCj4+
PiBlbmRwb2ludEAwIC4KPj4+Cj4+PiBidHcuIEkgZG8gdXNlIGJvdGggZW5kcG9pbnRAMC9lbmRw
b2ludEAxIGluIEF2ZW5nZXI5NiBEVE9zLCBidXQgdGhvc2UgYXJlIG5vdAo+Pj4gc3VibWl0dGVk
IHlldCwgSSBoYXZlIHRvIGNsZWFuIHRoZW0gdXAgYSBiaXQgbW9yZSBmaXJzdC4KPj4+Cj4+Pj4g
T25lIHdheSB0byBkbyBpdCB3b3VsZCBiZSB0byBtYWtlIHRoZSBlbmRwb2ludEAwIGdvIGRvd24g
aW4gdGhlIGRldmljZS10cmVlCj4+Pj4gd2l0aAo+Pj4+IGl0cyBkZXBlbmRlbmNpZXMsIHNvIHRo
YXQgYm90aCBlbmRwb2ludHMgYXJlIHRoZSBzYW1lIGxldmVsIHdpdGhvdXQgZ2VuZXJhdGluZwo+
Pj4+IG5vaXNlLgo+Pj4KPj4+IEknbSBhZnJhaWQgSSByZWFsbHkgZG9uJ3QgcXVpdGUgdW5kZXJz
dGFuZCB3aGljaCB3YXJuaW5nIHlvdSdyZSByZWZlcnJpbmcgdG8uCj4+PiBDYW4geW91IHBsZWFz
ZSBzaGFyZSB0aGF0IHdhcm5pbmcgYW5kIGlkZWFsbHkgaG93IHRvIHRyaWdnZXIgaXQgKHRoZQo+
Pj4gY29tbWFuZC1saW5lIGluY2FudGF0aW9uKSA/Cj4+Cj4+IFVzaW5nICckIG1ha2UgZHRicyBX
PTEnLCB5b3UgY2FuIG9ic2VydmUgc2V2ZXJhbCBvZiB0aGUgZm9sbG93aW5nczoKPj4KPj4gYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNpOjE1MzMuOS0xNTM2LjY6IFdhcm5pbmcKPj4g
KGF2b2lkX3VubmVjZXNzYXJ5X2FkZHJfc2l6ZSk6IC9zb2MvZGlzcGxheS1jb250cm9sbGVyQDVh
MDAxMDAwL3BvcnQ6Cj4+IHVubmVjZXNzYXJ5ICNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxzIHdp
dGhvdXQgInJhbmdlcyIgb3IgY2hpbGQgInJlZyIgcHJvcGVydHkKPj4gYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1MS5kdHNpOjE1MzMuOS0xNTM2LjY6IFdhcm5pbmcgKGdyYXBoX2NoaWxkX2Fk
ZHJlc3MpOgo+PiAvc29jL2Rpc3BsYXktY29udHJvbGxlckA1YTAwMTAwMC9wb3J0OiBncmFwaCBu
b2RlIGhhcyBzaW5nbGUgY2hpbGQgbm9kZQo+PiAnZW5kcG9pbnRAMCcsICNhZGRyZXNzLWNlbGxz
LyNzaXplLWNlbGxzIGFyZSBub3QgbmVjZXNzYXJ5Cj4+Cj4+IFRoaXMgJmx0ZGMgeyBwb3J0IHsg
I2FkZHJlc3MtY2VsbHMgPSA8MT47ICNzaXplLWNlbGxzID0gPDA+OyB9OyB9OyBwYXJ0IGlzCj4+
IGFjdHVhbGx5IGFubm95aW5nLiBUaGlzIGlzIGJlY2F1c2UgdGhlcmUgaXMgc2V2ZXJhbCBkZXZp
Y2UtdHJlZXMgdGhhdCBvbmx5IGdvdAo+PiBvbmUgZW5kcG9pbnQsIGFuZCBzb21lIG90aGVyIHRo
YXQgaW5jbHVkZXMgdHdvLgo+Pgo+PiBGb3IgaW5zdGFuY2U6IHN0bTMybXAxNXh4LWRoY29yLWF2
ZW5nZXI5Ni5kdHNpIHZzIHN0bTMybXAxNTdjLWRrMi5kdHMuCj4+Cj4+IEkgd291bGQgbGlrZSB0
byByZW1vdmUgdG8gcm9vdCBwYXJ0IG9mIGFkZHJlc3Mvc2l6ZSBmaWVsZCBhbmQgbGV0IG9ubHkg
dGhlIGxvd2VyCj4+IGRldmljZS10cmVlcyB3aXRoIHdpdGggbXVsdGlwbGUgZW5kcG9pbnRzIGhh
bmRsZSB0aGVpciBvd24gZmllbGRzLiBJIGhvcGUgdGhpcwo+PiBleHBsYWlucyBhIGJpdCBiZXR0
ZXIgbXkgcHJvY2Vzcy4KPgo+IEFmdGVyIHRoaW5raW5nIGFib3V0IHRoaXMgc29tZSBtb3JlLCBh
bmQgZGlnZ2luZyB0aHJvdWdoIExUREMgZHJpdmVyLCBhbmQKPiB0ZXN0aW5nIG9uIEVWMSwgSSB0
aGluayBkcm9wcGluZyB0aGUgTFREQyBub2RlIGVuZHBvaW50QE4gYW5kIHJlZz08Tj4KPiBhbHRv
Z2V0aGVyIGFuZCBqdXN0IHVzaW5nIHBvcnQvZW5kcG9pbnQgKHNpbmd1bGFyKSBpcyBmaW5lLgo+
Cj4gWW91IG1pZ2h0IHdhbnQgdG8gc3BsaXQgdGhlIERTSSBub2RlIHNwZWNpZmljIGNoYW5nZXMg
YW5kIHRoZSBMVERDIG5vZGUKPiBzcGVjaWZpYyBjaGFuZ2VzIGludG8gc2VwYXJhdGUgcGF0Y2hl
cyAoTFREQyBzcGVjaWZpYyBjaGFuZ2UgbGlrZSB5b3UgZGlkIGluCj4gMS8zKS4KClllcywgSSBw
cmVwYXJlZCBhIG5ldyBzZXJpZSB3aXRoIHRoYXQgc3BsaXQsIHRvIHRoYXQgaXQgaXMgYmV0dGVy
IHRvIHJlYWQgYW5kCnJldmlldy4KCgpSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
