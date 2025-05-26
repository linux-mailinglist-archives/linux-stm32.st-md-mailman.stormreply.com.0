Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E3AC3AA3
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 09:30:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7834AC36B0C;
	Mon, 26 May 2025 07:30:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEBAFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 07:30:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q6SCL0005493;
 Mon, 26 May 2025 09:29:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lTDE2wTWZMgeazVaiUjwUqBmNK0bFNpP2NUy4dywBoQ=; b=ivq9k5wkkgImWz8e
 OgYaMgLRKQm64L3kTznaiEm1CCggncqx/b5InZc+2pbSRvNaZvgF3SJu+n1ObOjj
 ul0ZdGCnzuRBOAvzO94zqas9EueTrjE/orpcOEWu8kuOn1JI3V6srHR9YOqcbYOJ
 /gWlrW9iwYlS0pYIvB6ksAkrDLeOOaYyIgG7q48MqgHDNiGtvznOzNLjjiwA0Wpv
 SdjdNNYakOhzIQUSrdv7wO9rC5QdU9NG/ydi9GeEvP4QHi72GEzU4xbGrSFSvsYx
 RoEL5IXYTbWr7qOopPaVOWSVHGLKwibxODLYlRhxlbvOFS3T4gQJ+5/2f+70fGNi
 06hfuQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u388npe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 May 2025 09:29:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC9A440048;
 Mon, 26 May 2025 09:28:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C894EB2E883;
 Mon, 26 May 2025 09:27:24 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 09:27:23 +0200
Message-ID: <9d3df716-343f-4c32-9e2e-2058bc1a9b6f@foss.st.com>
Date: Mon, 26 May 2025 09:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 <amelie.delaunay@foss.st.com>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
 <20250524100319.22521-2-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250524100319.22521-2-himanshu.bhavani@siliconsignals.io>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_04,2025-05-22_01,2025-03-28_01
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roan van Dijk <roan@protonic.nl>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/2] ARM: dts: stm32: add support of
 stm32mp157f-dk2 board
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

SGkgSGltYW5zaHUKCk9uIDUvMjQvMjUgMTI6MDMsIEhpbWFuc2h1IEJoYXZhbmkgd3JvdGU6Cj4g
U1RNMzJNUDE1N0YgaXMgc2ltaWxhciB0byB0aGUgU1RNMzJNUDE1N0MsIHNvIHJldXNlIHRoZSBl
eGlzdGluZwo+IHN0bTMybXAxNTdjLWRrMi5kdHMgYXMgYSBiYXNlIGZvciB0aGUgU1RNMzJNUDE1
N0YtREsyIGJvYXJkLgo+IAo+IERhdGFzaGVldDogaHR0cHM6Ly93d3cuc3QuY29tL3Jlc291cmNl
L2VuL2RhdGFfYnJpZWYvc3RtMzJtcDE1N2YtZGsyLnBkZgo+IFNpZ25lZC1vZmYtYnk6IEhpbWFu
c2h1IEJoYXZhbmkgPGhpbWFuc2h1LmJoYXZhbmlAc2lsaWNvbnNpZ25hbHMuaW8+Cj4gLS0tCj4g
ICBhcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZSAgICAgICAgICAgIHwgIDMgKystCj4gICBh
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Zi1kazIuZHRzIHwgMTUgKysrKysrKysrKysr
KysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Zi1k
azIuZHRzCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlIGIv
YXJjaC9hcm0vYm9vdC9kdHMvc3QvTWFrZWZpbGUKPiBpbmRleCA2MGQ1NTUxNmY3MjMuLjM4MTc5
NjM4ZTVlYiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZQo+ICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlCj4gQEAgLTcwLDcgKzcwLDggQEAgZHRi
LSQoQ09ORklHX0FSQ0hfU1RNMzIpICs9IFwKPiAgIAlzdG0zMm1wMTU3Yy1seGEtdGFjLWdlbjIu
ZHRiIFwKPiAgIAlzdG0zMm1wMTU3Yy1vZHlzc2V5LmR0YiBcCj4gICAJc3RtMzJtcDE1N2Mtb3Nk
MzJtcDEtcmVkLmR0YiBcCj4gLQlzdG0zMm1wMTU3Yy1waHljb3JlLXN0bTMybXAxLTMuZHRiCj4g
KwlzdG0zMm1wMTU3Yy1waHljb3JlLXN0bTMybXAxLTMuZHRiIFwKPiArCXN0bTMybXAxNTdmLWRr
Mi5kdGIKPiAgIGR0Yi0kKENPTkZJR19BUkNIX1U4NTAwKSArPSBcCj4gICAJc3RlLXNub3diYWxs
LmR0YiBcCj4gICAJc3RlLWhyZWZwcmV2NjAtc3R1aWIuZHRiIFwKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2YtZGsyLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxNTdmLWRrMi5kdHMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uYWI0MDZiMmM0NGMxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdmLWRrMi5kdHMKPiBAQCAtMCwwICsxLDE1IEBACj4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgQlNELTMtQ2xhdXNlKQo+ICsv
Kgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgU2lsaWNvbiBTaWduYWxzIFB2dC4gTHRkLgo+ICsg
Kgo+ICsgKiBBdXRob3I6IEhpbWFuc2h1IEJoYXZhbmkgPGhpbWFuc2h1LmJoYXZhbmlAc2lsaWNv
bnNpZ25hbHMuaW8+Cj4gKyAqLwo+ICsKPiArL2R0cy12MS87Cj4gKwo+ICsjaW5jbHVkZSAic3Rt
MzJtcDE1N2MtZGsyLmR0cyIKCkluIHRoaXMgY2FzZSB3aGF0IGlzIHRoZSBhaW0gb2YgdGhpcyBz
ZXJpZXMgaWYgeW91IGp1c3QgdXNlIHN0bTMybXAxNTdDIApkZXZpY2V0cmVlID8KClNUIHBlb3Bs
ZSAobWFpbmx5IEFtw6lsaWUpIGFyZSBwcmVwYXJpbmcgYSBmdWxsIHN1cHBvcnQgb2YgClNUTTMy
TVAxNTdGLURLMiBsZXZlcmFnaW5nIHRoZSBGIHZhcmlhbnQgY29tcGFyZSB0byB0aGUgQyB2YXJp
YW50LiAKU2VyaWVzIHdpbGwgYmUgc2VudCB0aGlzIHdlZWsuCgpSZWdhcmRzCkFsZXgKCj4gKwo+
ICsvIHsKPiArCW1vZGVsID0gIlNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMTU3Ri1ESzIgRGlz
Y292ZXJ5IEJvYXJkIjsKPiArCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDE1N2YtZGsyIiwgInN0
LHN0bTMybXAxNTciOwo+ICt9OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
