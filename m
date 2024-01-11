Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56382B0AB
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 15:28:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98F48C6DD73;
	Thu, 11 Jan 2024 14:28:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D98EC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 14:28:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40BA26F2006046; Thu, 11 Jan 2024 15:27:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=wTVjmGwYeV5sAYER1puGnO1qZuq5/BoWjcAmcf+ualw=; b=Nh
 AGUF3fPYpTsl7KrzeNza89HbQL5gIOWEJu4JgU4OsDIdqfk5iPWv+L8iCA5vdmaw
 aSu0ZLbk6oP4EYKRL26SirDEN2eH7SVdog8UqvXxvMh8fFfRCe8nLaasV0JbIK3P
 KEsUG8bz62RV5fbPSS8krfWb3955BZX/zdco9Gue5dTWpbvOFyesF4WGYMXGSmTy
 N8/XX/UC0XtT+pldsoQwjGG8GFCojFgw6k55uFkHc6CsosqCIr4b1BnuNEbw/jlG
 R98GfhMueBKa0HPQ+1YCoXF2UerVAZLhMZ47P0yb/VBLzNWJyhY8bITnyHGIfp3s
 0uvB0cu1lUxcJ1V/mfjw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vexrcdgku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 15:27:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE0D910002A;
 Thu, 11 Jan 2024 15:27:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C09EA27DAAE;
 Thu, 11 Jan 2024 15:27:55 +0100 (CET)
Received: from [10.252.29.122] (10.252.29.122) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Jan
 2024 15:27:54 +0100
Message-ID: <a0888e25-4427-420c-a14d-d6504440805c@foss.st.com>
Date: Thu, 11 Jan 2024 15:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20240111113146.16011-1-dario.binacchi@amarulasolutions.com>
 <20240111113146.16011-6-dario.binacchi@amarulasolutions.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240111113146.16011-6-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.29.122]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 5/5] ARM: dts: add
 stm32f769-disco-mb1225-revb03-mb1166-reva09
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

Ck9uIDEvMTEvMjQgMTI6MzEsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEFzIHJlcG9ydGVkIGlu
IHRoZSBzZWN0aW9uIDguMyAoaS4gZS4gQm9hcmQgcmV2aXNpb24gaGlzdG9yeSkgb2YgZG9jdW1l
bnQKPiBVTTIwMzMgKGkuIGUuIERpc2NvdmVyeSBraXQgd2l0aCBTVE0zMkY3NjlOSSBNQ1UpIHRo
ZXNlIGFyZSB0aGUgY2hhbmdlcwo+IHJlbGF0ZWQgdG8gdGhlIGJvYXJkIHJldmlzaW9ucyBhZGRy
ZXNzZWQgYnkgdGhlIHBhdGNoOgo+IC0gQm9hcmQgTUIxMjI1IHJldmlzaW9uIEItMDM6Cj4gICAt
IE1lbW9yeSBNSUNST04gTVQ0OExDNE0zMkIyQjUtNkEgcmVwbGFjZWQgYnkgSVNTSSBJUzQyUzMy
NDAwRi02QkwKPiAtIEJvYXJkIE1CMTE2NiByZXZpc2lvbiBBLTA5Ogo+ICAgLSBMQ0QgRlJJREEg
RlJEMzk3QjI1MDA5LUQtQ1RLIHJlcGxhY2VkIGJ5IEZSSURBIEZSRDQwMEIyNTAyNS1BLUNUSwo+
Cj4gVGhlIHBhdGNoIG9ubHkgYWRkcyB0aGUgRFRTIHN1cHBvcnQgZm9yIHRoZSBuZXcgZGlzcGxh
eSB3aGljaCBiZWxvbmdzIHRvCj4gdG8gdGhlIE5vdmF0ZWsgTlQzNTUxMC1iYXNlZCBwYW5lbCBm
YW1pbHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlA
YW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4KSGkgRGFyaW8sCgoKUmV2aWV3ZWQtYnk6IFJhcGhhZWwg
R2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+CgoKUmVnYXJkcywK
ClJhcGhhw6tsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
