Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D787582DDF7
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jan 2024 17:52:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80B6AC6B457;
	Mon, 15 Jan 2024 16:52:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47CA5C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 16:51:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FDrZU1008279; Mon, 15 Jan 2024 17:51:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=v/GemSIloeASK3WLJ1Xew5INevRA7DxBKaKXrgp0BrI=; b=yW
 I9NouHDCyq43z3fEbedcH1DBWBHnlGwKnS2NFXi0ofmWWeaCMJLvOFimeL7TiLvv
 0Rm4EJ2vXjSkSoVbG93Q47Ib0LjVySE0FJVc83GQM3158cyKguQ0YwenISvU75T8
 f3odqvHeu7q26Ic++F5pOUt2H/vQUM917hoP0IiHBHWN/a6+h/dlmUX+NciD0XP5
 3DpK0ZkYCCBHWuncmuD7WFLnDxGiyliD3bzb0BuQIKszMEPo5/WG4xXrrN9R8/J1
 swRCMM6ZEKiw8y3RVrwDxe+boWapMNCRfB6KaVFEet/6LA3P/crX6rXDVcgJ3iQt
 H1hlwJ5mEXRw1hxKmdGw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddstng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 17:51:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1111910002A;
 Mon, 15 Jan 2024 17:51:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE6662EAB7A;
 Mon, 15 Jan 2024 17:51:28 +0100 (CET)
Received: from [10.129.178.37] (10.129.178.37) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 17:51:28 +0100
Message-ID: <3479c5d7-a9c3-40cf-a415-b8324f160ec7@foss.st.com>
Date: Mon, 15 Jan 2024 17:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20240115132009.101718-1-raphael.gallais-pou@foss.st.com>
 <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
 <20240115154659.GA815331-robh@kernel.org>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240115154659.GA815331-robh@kernel.org>
X-Originating-IP: [10.129.178.37]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/6] dt-bindings: display: add
 dt-bindings for STM32 LVDS device
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

Ck9uIDEvMTUvMjQgMTY6NDYsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDE1LCAy
MDI0IGF0IDAyOjIwOjA0UE0gKzAxMDAsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IEFk
ZCAic3Qsc3RtMzJtcDI1LWx2ZHMiIGNvbXBhdGlibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJh
cGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4+IC0t
LQo+PiBEZXBlbmRzIG9uOiAiZHQtYmluZGluZ3M6IHN0bTMyOiBhZGQgY2xvY2tzIGFuZCByZXNl
dCBiaW5kaW5nIGZvcgo+PiAJICAgIHN0bTMybXAyNSBwbGF0Zm9ybSIgYnkgR2FicmllbCBGZXJu
YW5kZXoKPj4KPj4gQ2hhbmdlcyBpbiB2MzoKPj4gCS0gQ2xhcmlmeSBjb21taXQgZGVwZW5kZW5j
eQo+PiAJLSBGaXggaW5jbHVkZXMgaW4gdGhlIGV4YW1wbGUKPj4gCS0gRml4IFlBTUwKPj4gCS0g
QWRkICJjbG9jay1jZWxscyIgZGVzY3JpcHRpb24KPj4gCS0gcy9yZWdyb3Vwcy9pcyBjb21wb3Nl
ZCBvZi8KPj4gCS0gQ2hhbmdlZCBjb21wYXRpYmxlIHRvIHNob3cgU29DIHNwZWNpZmljaXR5Cj4+
Cj4+IENoYW5nZXMgaW4gdjI6Cj4+IAktIFN3aXRjaCBjb21wYXRpYmxlIGFuZCBjbG9jay1jZWxs
cyByZWxhdGVkIGFyZWFzCj4+IAktIFJlbW92ZSBmYXVsdHkgI2luY2x1ZGUgaW4gdGhlIGV4YW1w
bGUuCj4+IAktIEFkZCBlbnRyeSBpbiBNQUlOVEFJTkVSUwo+PiAtLS0KPj4gIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L3N0LHN0bTMyLWx2ZHMueWFtbCAgICAgICB8IDExOSArKysrKysrKysrKysrKysr
KysKPiBGaWxlbmFtZSBtYXRjaGluZyBjb21wYXRpYmxlLgoKSGkgUm9iLAoKCkkgd2FzIHVuc3Vy
ZSBhYm91dCB0aGlzLgoKVGhlIGRyaXZlciB3aWxsIGV2ZW50dWFsbHkgc3VwcG9ydCBzZXZlcmFs
IFNvQ3Mgd2l0aCBkaWZmZXJlbnQgY29tcGF0aWJsZXMsCndvdWxkbid0IHRoaXMgYmUgbW9yZSBj
b25mdXNpbmcgPwoKSSBhbHNvIHdhbnRlZCB0byBrZWVwIHRoZSBzaW1pbGFyaXR5IHdpdGggdGhl
ICJzdCxzdG0zMi08aXA+LnlhbWwiIG5hbWUgZm9yIHRoZQpEUk0gU1RNIGRyaXZlcnMuIFdvdWxk
IHRoYXQgYmUgcG9zc2libGUgPwoKClJlZ2FyZHMsCgpSYXBoYcOrbAoKCgo+Cj4+ICtwcm9wZXJ0
aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGNvbnN0OiBzdCxzdG0zMm1wMjUtbHZkcwo+
Cj4+ICtleGFtcGxlczoKPj4gKyAgLSB8Cj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL3N0LHN0bTMybXAyNS1yY2MuaD4KPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVz
ZXQvc3Qsc3RtMzJtcDI1LXJjYy5oPgo+PiArCj4+ICsgICAgbHZkczogbHZkc0A0ODA2MDAwMCB7
Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzItbHZkcyI7Cj4gV3JvbmcgY29tcGF0
aWJsZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
