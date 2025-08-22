Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5FBB318EF
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 15:12:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E211CC3F95B;
	Fri, 22 Aug 2025 13:12:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB0E1C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 13:12:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCcqnv031363;
 Fri, 22 Aug 2025 15:12:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GokK0EwgMtfsSNnIpttne/zzS1Pm4lLm8u+xuFpTDOc=; b=0Eedm75kc0PDSdky
 /8jqHNndow2ZEb5RGHoy9LDDl00fo7DN6SI+sP01h0hN4/eGmIohw8BY+4hnQ7TK
 QJIMF7f/QQPTc1auYlfMmDjrNgw7pa4havE+xo6jvNi3jwYsG0ssCAr+A0clIdb2
 ih4l/a8IJcuw8mIqnVosxq2OSXKWOrRHTJE5qqMyYKzZ8LsqE+K5jWHpOxP5ePeF
 FWVyfur2bVOnOYGxfybcYo7SsAj0BCWT17YbvQdJsYhdOhEmYIM1kpi9+og2Q64M
 9Rh7ilp4ZnMMZRQMnkuDw9cTbbYvHqOBde8ooYnKiZXZDD9RBwshHnxecYV+c8V2
 9ZmL8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nd5xs993-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 15:12:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F380D4002D;
 Fri, 22 Aug 2025 15:11:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 415ED7206CF;
 Fri, 22 Aug 2025 15:10:19 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 15:10:18 +0200
Message-ID: <d193523c-5508-4bba-971b-8c0a8b7b44de@foss.st.com>
Date: Fri, 22 Aug 2025 15:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-13-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-13-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 13/13] arm64: dts: st: enable display
 support on stm32mp257f-ev1 board
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkxlIDIxLzA4LzIwMjUgw6AgMTM6MDks
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBFbmFibGUgdGhlIGZvbGxvd2luZyBJ
UHMgb24gc3RtMzJtcDI1N2YtZXYxIGluIG9yZGVyIHRvIGdldCBkaXNwbGF5Ogo+ICAgICAqIExU
REMKPiAgICAgKiBMVkRTCj4gICAgICogV1NWR0EgTFZEUyBwYW5lbCAoMTAyNHg2MDApCj4gICAg
ICogUGFuZWwgTFZEUyBiYWNrbGlnaHQgYXMgR1BJTyBiYWNrbGlnaHQKPiAgICAgKiBJTEkyNTEx
IGkyYyB0b3VjaHNjcmVlbgo+Cj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8
cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJtNjQvYm9v
dC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyB8IDc5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2MS5kdHMgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2MS5kdHMKPiBpbmRleCA4MzZiMTk1OGNlNjVm
YjcyYzk5ZDYzNGE5MmFmM2VmYWY5ODQ0ZDc2Li4yOTU4YWQ0MTNiMDY3NTU3NWQ4NDk0MmUxOTNh
MTZmODAxOTdiODhlIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJt
cDI1N2YtZXYxLmR0cwo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2Yt
ZXYxLmR0cwo+IEBAIC04Niw2ICs4Niw0MyBAQCBtbV9vc3BpMTogbW0tb3NwaUA2MDAwMDAwMCB7
Cj4gICAJCQluby1tYXA7Cj4gICAJCX07Cj4gICAJfTsKPiArCj4gKwlwYW5lbF9sdmRzOiBkaXNw
bGF5IHsKPiArCQljb21wYXRpYmxlID0gImVkdCxldG1sMDcwMHo5bmRoYSIsICJwYW5lbC1sdmRz
IjsKPiArCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW9nIDE1IEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsJ
CWJhY2tsaWdodCA9IDwmcGFuZWxfbHZkc19iYWNrbGlnaHQ+Owo+ICsJCXBvd2VyLXN1cHBseSA9
IDwmc2NtaV92M3YzPjsKPiArCQlzdGF0dXMgPSAib2theSI7Cj4gKwo+ICsJCXdpZHRoLW1tID0g
PDE1Nj47Cj4gKwkJaGVpZ2h0LW1tID0gPDkyPjsKPiArCQlkYXRhLW1hcHBpbmcgPSAidmVzYS0y
NCI7Cj4gKwo+ICsJCXBhbmVsLXRpbWluZyB7Cj4gKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDw1NDAw
MDAwMD47Cj4gKwkJCWhhY3RpdmUgPSA8MTAyND47Cj4gKwkJCXZhY3RpdmUgPSA8NjAwPjsKPiAr
CQkJaGZyb250LXBvcmNoID0gPDE1MD47Cj4gKwkJCWhiYWNrLXBvcmNoID0gPDE1MD47Cj4gKwkJ
CWhzeW5jLWxlbiA9IDwyMT47Cj4gKwkJCXZmcm9udC1wb3JjaCA9IDwyND47Cj4gKwkJCXZiYWNr
LXBvcmNoID0gPDI0PjsKPiArCQkJdnN5bmMtbGVuID0gPDIxPjsKPiArCQl9Owo+ICsKPiArCQlw
b3J0IHsKPiArCQkJbHZkc19wYW5lbF9pbjogZW5kcG9pbnQgewo+ICsJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZsdmRzX291dDA+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwl9Owo+ICsKPiArCXBhbmVs
X2x2ZHNfYmFja2xpZ2h0OiBiYWNrbGlnaHQgewo+ICsJCWNvbXBhdGlibGUgPSAiZ3Bpby1iYWNr
bGlnaHQiOwo+ICsJCWdwaW9zID0gPCZncGlvaSA1IEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsJCWRl
ZmF1bHQtb247Cj4gKwkJc3RhdHVzID0gIm9rYXkiOwo+ICsJfTsKPiAgIH07Cj4gICAKPiAgICZh
cm1fd2R0IHsKPiBAQCAtMTgzLDYgKzIyMCwxNSBAQCBpbXgzMzVfZXA6IGVuZHBvaW50IHsKPiAg
IAkJCX07Cj4gICAJCX07Cj4gICAJfTsKPiArCj4gKwlpbGkyNTExOiBpbGkyNTExQDQxIHsKPiAr
CQljb21wYXRpYmxlID0gImlsaXRlayxpbGkyNTF4IjsKPiArCQlyZWcgPSA8MHg0MT47Cj4gKwkJ
aW50ZXJydXB0LXBhcmVudCA9IDwmZ3Bpb2k+Owo+ICsJCWludGVycnVwdHMgPSA8MTMgSVJRX1RZ
UEVfRURHRV9GQUxMSU5HPjsKPiArCQlyZXNldC1ncGlvcyA9IDwmZ3Bpb2cgMTQgR1BJT19BQ1RJ
VkVfTE9XPjsKPiArCQlzdGF0dXMgPSAib2theSI7Cj4gKwl9Owo+ICAgfTsKPiAgIAo+ICAgJmky
Yzggewo+IEBAIC0yMzAsNiArMjc2LDM5IEBAIHRpbWVyIHsKPiAgIAl9Owo+ICAgfTsKPiAgIAo+
ICsmbHRkYyB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gKwo+ICsJcG9ydCB7Cj4gKwkJbHRkY19l
cDBfb3V0OiBlbmRwb2ludCB7Cj4gKwkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkc19pbj47Cj4g
KwkJfTsKPiArCX07Cj4gK307Cj4gKwo+ICsmbHZkcyB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4g
Kwo+ICsJcG9ydHMgewo+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJCSNzaXplLWNlbGxz
ID0gPDA+Owo+ICsKPiArCQlwb3J0QDAgewo+ICsJCQlyZWcgPSA8MD47Cj4gKwkJCWx2ZHNfaW46
IGVuZHBvaW50IHsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHRkY19lcDBfb3V0PjsKPiAr
CQkJfTsKPiArCQl9Owo+ICsKPiArCQlwb3J0QDEgewo+ICsJCQlyZWcgPSA8MT47Cj4gKwkJCWx2
ZHNfb3V0MDogZW5kcG9pbnQgewo+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX3BhbmVs
X2luPjsKPiArCQkJfTsKPiArCQl9Owo+ICsJfTsKPiArfTsKPiArCj4gICAmcnRjIHsKPiAgIAlz
dGF0dXMgPSAib2theSI7Cj4gICB9Owo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
