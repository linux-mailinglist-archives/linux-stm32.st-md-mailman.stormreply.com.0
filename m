Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823B6C1AFC
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 17:14:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D07B1C6A5F6;
	Mon, 20 Mar 2023 16:14:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44DABC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 16:14:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KF4Yt6019970; Mon, 20 Mar 2023 17:13:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NgXwip3o4wXvf5NxUnDvu10B6XH84zMDeQuJvYMe7Vg=;
 b=K9zLZUzMadtdLq2tG/MTTTVQfBEic3JY21LeF+gOr89GdIgdZH8EOLeQSSthS7VGhcSv
 Uo8kxadvOjMJ8gAmqRJulD0dRgNn8IeXhqb8NvGzifjLd0Uee2cKwHWc8l80cd0ygVVx
 gNQW/ULIcHGc1HqW0iqMKxfOSH/B/VFc+Ns/hfNk9pl/B+mH4KYETXOY4nWIixVeb8bP
 cYDVo1myfPxdzylphr88capYzDlMTYqgSDkE2UyxWXoGlOZUvL15uCJ1yAH2uWDp7BPb
 Yt+mXJJ+C7nOBn/ETUzIXkeM/D1qIUzS3uHD6BaAhJ6egDwYV2GD2FXViTthZkCTtz9b LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pekqx3bh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 17:13:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D7D610002A;
 Mon, 20 Mar 2023 17:13:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 276AB216EFE;
 Mon, 20 Mar 2023 17:13:56 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 20 Mar
 2023 17:13:55 +0100
Message-ID: <37b5bf6c-c290-1283-1dca-6e8fdbf7f430@foss.st.com>
Date: Mon, 20 Mar 2023 17:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20230310092650.1007662-1-l.goehrs@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230310092650.1007662-1-l.goehrs@pengutronix.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_13,2023-03-20_02,2023-02-09_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v1] ARM: dts: stm32: Add coprocessor
 detach mbox on stm32mp15xx-osd32 SoM
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTGVvbmFyZAoKT24gMy8xMC8yMyAxMDoyNiwgTGVvbmFyZCBHw7ZocnMgd3JvdGU6Cj4gVG8g
c3VwcG9ydCB0aGUgZGV0YWNoIGZlYXR1cmUsIGFkZCBhIG5ldyBtYWlsYm94IGNoYW5uZWwgdG8g
aW5mb3JtCj4gdGhlIHJlbW90ZSBwcm9jZXNzb3Igb24gYSBkZXRhY2guIFRoaXMgc2lnbmFsIGFs
bG93cyB0aGUgcmVtb3RlIHByb2Nlc3Nvcgo+IGZpcm13YXJlIHRvIHN0b3AgSVBDIGNvbW11bmlj
YXRpb24gYW5kIHRvIHJlaW5pdGlhbGl6ZSB0aGUgcmVzb3VyY2VzIGZvcgo+IGEgcmUtYXR0YWNo
Lgo+IAo+IFNlZSA2MjU3ZGZjMWM0MTJkY2RiZDc2Y2E1ZmE5MmM4NDQ0MjIyZGJlNWIwIGZvciBh
IHBhdGNoIHRoYXQgZG9lcyB0aGUKPiBzYW1lIGZvciBzdG0zMm1wMTV4LWRreCBib2FyZHMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRl
Pgo+IC0tLQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaSB8IDQg
KystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LW9zZDMyLmR0c2kKPiBpbmRleCA5MzVi
NzA4NGI1YTIuLmE0Mzk2NWM4NmZlOCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTV4eC1vc2QzMi5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
eHgtb3NkMzIuZHRzaQo+IEBAIC0yMTAsOCArMjEwLDggQEAgJmlwY2Mgewo+ICAgJm00X3Jwcm9j
IHsKPiAgIAltZW1vcnktcmVnaW9uID0gPCZyZXRyYW0+LCA8Jm1jdXJhbT4sIDwmbWN1cmFtMj4s
IDwmdmRldjB2cmluZzA+LAo+ICAgCQkJPCZ2ZGV2MHZyaW5nMT4sIDwmdmRldjBidWZmZXI+Owo+
IC0JbWJveGVzID0gPCZpcGNjIDA+LCA8JmlwY2MgMT4sIDwmaXBjYyAyPjsKPiAtCW1ib3gtbmFt
ZXMgPSAidnEwIiwgInZxMSIsICJzaHV0ZG93biI7Cj4gKwltYm94ZXMgPSA8JmlwY2MgMD4sIDwm
aXBjYyAxPiwgPCZpcGNjIDI+LCA8JmlwY2MgMz47Cj4gKwltYm94LW5hbWVzID0gInZxMCIsICJ2
cTEiLCAic2h1dGRvd24iLCAiZGV0YWNoIjsKPiAgIAlpbnRlcnJ1cHQtcGFyZW50ID0gPCZleHRp
PjsKPiAgIAlpbnRlcnJ1cHRzID0gPDY4IDE+Owo+ICAgCXN0YXR1cyA9ICJva2F5IjsKPiAKCkFw
cGxpZWQgb24gc3RtMzItbmV4dC4KClRoYW5rcy4KQWxleAoKPiBiYXNlLWNvbW1pdDogZmUxNWMy
NmVlMjZlZmExMTc0MWE3YjYzMmU5ZjIzYjAxYWNhNGNjNgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
