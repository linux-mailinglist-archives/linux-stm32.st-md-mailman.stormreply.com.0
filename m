Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB780B318E7
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 15:11:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF0DEC3F95B;
	Fri, 22 Aug 2025 13:11:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17501C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 13:11:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCCaeX015941;
 Fri, 22 Aug 2025 15:11:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 B4pYdqJuAzYUBYGLZvAHsnWM97Hp3xHmy6gGSOZhTl0=; b=sm++KblT0vJdhu/X
 xpsgsy8lD9wXrhreSVLSBAtXvdBHIfmWKkBS1wuwTe/6PWel5AzEmcLpZMJOAqIP
 lkY1KdnfrzieOgZ09ggEIaWPSdc+TyLimjZjQOq51CN0mfaRzSVtCo+0mE0jB2Xs
 F1bAPglIEIb8MCDtEsyc0DhTZpbtvPvRhb8f+D7jOUS7uF4FwBnaTbXfF8GVt624
 EMgwNxTea9UynQvLx1X+5dfZJmfOfAaahFe3JHRvnAv1mU5Es9shzQdG9LEXMDLh
 Rd789ZhVXr9hQFyCZLJfnHZvj1gmlEH/8blMCP4z+P8JF2lnGlS2RG3jTUT+qBDZ
 uX+evw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n70dk7g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 15:11:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5460840050;
 Fri, 22 Aug 2025 15:09:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 975616CA48F;
 Fri, 22 Aug 2025 15:08:58 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 15:08:57 +0200
Message-ID: <44b7b47d-a42c-499d-a760-f34d2740ff8c@foss.st.com>
Date: Fri, 22 Aug 2025 15:08:57 +0200
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
 <20250821-drm-misc-next-v4-11-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-11-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 11/13] arm64: dts: st: add lvds support
	on stm32mp255
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
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBUaGUgTFZEUyBpcyB1c2VkIG9uIFNU
TTMyTVAyIGFzIGEgZGlzcGxheSBpbnRlcmZhY2UuCj4KPiBBZGQgdGhlIExWRFMgbm9kZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VA
Zm9zcy5zdC5jb20+Cj4gLS0tCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTUu
ZHRzaSB8IDE0ICsrKysrKysrKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
c3Qvc3RtMzJtcDI1NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0
c2kKPiBpbmRleCA0OGE5NWFmMTc0MWM0MjMwMDE5NWI3NTNiNzEwZTcxNGFiYzYwZDk2Li40MzNh
MGFhYmU3MmU1YTQ0OWVjMDNmYjk4NGE4Njg0YzVkNWQ3NWEyIDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1NS5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kKPiBAQCAtMTIsNiArMTIsMTggQEAgJmx0ZGMgewo+ICAg
fTsKPiAgIAo+ICAgJnJpZnNjIHsKPiArCWx2ZHM6IGx2ZHNANDgwNjAwMDAgewo+ICsJCWNvbXBh
dGlibGUgPSAic3Qsc3RtMzJtcDI1NS1sdmRzIiwgInN0LHN0bTMybXAyNS1sdmRzIjsKPiArCQkj
Y2xvY2stY2VsbHMgPSA8MD47Cj4gKwkJcmVnID0gPDB4NDgwNjAwMDAgMHgyMDAwPjsKPiArCQlj
bG9ja3MgPSA8JnJjYyBDS19CVVNfTFZEUz4sIDwmcmNjIENLX0tFUl9MVkRTUEhZPjsKPiArCQlj
bG9jay1uYW1lcyA9ICJwY2xrIiwgInJlZiI7Cj4gKwkJcmVzZXRzID0gPCZyY2MgTFZEU19SPjsK
PiArCQlhY2Nlc3MtY29udHJvbGxlcnMgPSA8JnJpZnNjIDg0PjsKPiArCQlwb3dlci1kb21haW5z
ID0gPCZDTFVTVEVSX1BEPjsKPiArCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsJfTsKPiArCj4g
ICAJdmRlYzogdmRlY0A0ODBkMDAwMCB7Cj4gICAJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1
LXZkZWMiOwo+ICAgCQlyZWcgPSA8MHg0ODBkMDAwMCAweDNjOD47Cj4gQEAgLTI4LDQgKzQwLDQg
QEAgdmVuYzogdmVuY0A0ODBlMDAwMCB7Cj4gICAJCWNsb2NrcyA9IDwmcmNjIENLX0JVU19WRU5D
PjsKPiAgIAkJYWNjZXNzLWNvbnRyb2xsZXJzID0gPCZyaWZzYyA5MD47Cj4gICAJfTsKPiAtfTsK
PiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPiArfTsKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
