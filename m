Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6379B0F482
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 15:51:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83189C36B3D;
	Wed, 23 Jul 2025 13:51:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76AD7C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 13:51:03 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NDEqHF005546;
 Wed, 23 Jul 2025 15:50:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 XdmtswUaNr7oJjimezjiXJoD/ZylkFXiGJCOd1EELY0=; b=uvEohgRVKt/NpkRA
 2i/LYLEavOHikPFmlWpRLubh47aTWuYUcAsWdGcrUlsIggOJk3nTEnTfSXiQ6Daq
 B397w3Fh+nhhWLrDXVVdDFbt458tDWAUTHZ58FMU+8tXuK4pSOpfQBtJqEgJCw6r
 513Jw9+03JgYy+PYBtQo1wGTKt68un91GsKESvT5TG0nYIw1d02PmjbMqrNvrS0x
 Ypa2hmlpQcecePuRJZIJcWv1afeUgNqHW2zrIfArB4cr+xbrUXqBBbkiJ2n56iQV
 Zy+D7YHaP3JFEzm4WfXxPTpOnFKUFmpjtC+6uIvZppe2H+Ti6lIA5vivoAgn0hVA
 vcadow==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4saep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 15:50:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 594BC4006F;
 Wed, 23 Jul 2025 15:49:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9763778896;
 Wed, 23 Jul 2025 15:49:08 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:49:07 +0200
Message-ID: <a9505893-c762-4cc9-b20e-4fccda7c1ac1@foss.st.com>
Date: Wed, 23 Jul 2025 15:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-2-1aa53ca319f4@foss.st.com>
 <20250723134148.GA2136293-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250723134148.GA2136293-robh@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 02/20] dt-bindings: stm32: stm32mp25:
 add `access-controller-cell` property
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

SGkgUm9iLAoKT24gNy8yMy8yNSAxNTo0MSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gV2VkLCBK
dWwgMjMsIDIwMjUgYXQgMDM6MDU6NDZQTSArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3Rl
Ogo+PiBSQ0MgaXMgYWJsZSB0byBjaGVjayB0aGUgYXZhaWxhYmlsaXR5IG9mIGEgY2xvY2suCj4+
IEFsbG93IHRvIHF1ZXJ5IHRoZSBSQ0Mgd2l0aCBhIGZpcmV3YWxsIElELgo+IAo+IFRoZSBzdWJq
ZWN0IGlzIHdyb25nLiBUaGVyZSBpcyBubyBzdWNoICJhY2Nlc3MtY29udHJvbGxlci1jZWxsIgo+
IHByb3BlcnR5LgoKSSBmb3VuZCBpdCBoZXJlIHRob3VnaDoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FjY2Vzcy1jb250cm9sbGVycy9hY2Nlc3MtY29udHJvbGxlcnMueWFtbAoK
QW5kIHdhbnQgdG8gdXNlIGl0IGxpa2UgaGVyZToKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2J1cy9zdCxzdG0zMi1ldHpwYy55YW1sOjQxCgpPaCBJIHNlZSBJIG1pZ2h0IG5lZWQg
dG8gYWRkIHRoZSAjLgoKQmVzdCByZWdhcmRzLApDbMOpbWVudApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
