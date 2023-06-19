Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020F734C61
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 09:30:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D469C6A60D;
	Mon, 19 Jun 2023 07:30:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5037C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 07:30:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35J54gIU016274; Mon, 19 Jun 2023 09:29:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WQGm1bnbcsMFKMHxBrg1wg70iXAEPal+ehfuwX2lwpw=;
 b=Nq2GjWQcY1art4ot8AmwMxDr+4p5P0fpvZtFS3RDbb/GO9bPhhBbHtRRolv09aw++2Yc
 FW9qyW2yngBDFfnKpJywcK7NjEQ3/fZ+qAAbQ1g9dFXLb4lHubXy8/+57cnJGr6bKIUP
 ZmDIVwIL3TrEQHpiyB5m4VXzKfZ3mqmM0F70xwBYb/69au+F48i9vjSVJ8spYu0a72MX
 YvemOYEFphDb6oiKiOG7m8lOR183KsXk5vR/S2jzRCjLszmzXCoF2l684DscwCzL3MT/
 uEFmW+cdAMHDxK7dJmjeNCXnwV94zN0365jx64W5d0/b7uX2tNQgkUXjh4na+gdcX1ao 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ragj9rqej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jun 2023 09:29:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93F0610002A;
 Mon, 19 Jun 2023 09:29:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F6462138E6;
 Mon, 19 Jun 2023 09:29:19 +0200 (CEST)
Received: from [10.201.21.210] (10.201.21.210) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 19 Jun
 2023 09:29:17 +0200
Message-ID: <78f8bd3d-c4a7-7383-441d-69cd8f5c30fb@foss.st.com>
Date: Mon, 19 Jun 2023 09:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson
 <ulf.hansson@linaro.org>
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
 <20230615092001.1213132-2-yann.gautier@foss.st.com>
 <CAPDyKFqJsqmNzeRg8hj55yUEMSycOWsmKVKsMWk4Qu7Y8_dNzg@mail.gmail.com>
 <3b6781cb-8f59-e70a-bcf8-9fb48fa47cbf@foss.st.com>
 <266de9f5-826a-c1bf-be8d-11f5e27c87dc@foss.st.com>
 <CACRpkdZLtCwPQsPw_Lp3Ppw2ed6gOo+-82_y2WPVJ_oZUHbLoQ@mail.gmail.com>
Content-Language: en-US
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CACRpkdZLtCwPQsPw_Lp3Ppw2ed6gOo+-82_y2WPVJ_oZUHbLoQ@mail.gmail.com>
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_04,2023-06-16_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Xiang wangx <wangxiang@cdjrlc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: mmc: mmci: Add st,
 stm32mp25-sdmmc2 compatible
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

T24gNi8xNS8yMyAyMDo1MSwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBUaHUsIEp1biAxNSwg
MjAyMyBhdCA1OjE54oCvUE0gWWFubiBHYXV0aWVyIDx5YW5uLmdhdXRpZXJAZm9zcy5zdC5jb20+
IHdyb3RlOgo+IAo+Pj4gICAgICAgICAtIGRlc2NyaXB0aW9uOiBFbnRyeSBmb3IgU1RNaWNyb2Vs
ZWN0cm9uaWNzIHZhcmlhbnQgb2YgUEwxOHguCj4+PiAgICAgICAgICAgICBUaGlzIGRlZGljYXRl
ZCBjb21wYXRpYmxlIGlzIHVzZWQgYnkgYm9vdGxvYWRlcnMuCj4gKC4uLikKPj4+ICAgICAgICAg
LSBkZXNjcmlwdGlvbjogRW50cnkgZm9yIFNUTWljcm9lbGVjdHJvbmljcyB2YXJpYW50IG9mIFBM
MTh4IGZvcgo+Pj4gICAgICAgICAgICAgU1RNMzJNUDI1LiBUaGlzIGRlZGljYXRlZCBjb21wYXRp
YmxlIGlzIHVzZWQgYnkgYm9vdGxvYWRlcnMuCj4gKC4uLikKPj4+IFNob3VsZCBJIHJlbW92ZSAo
b3IgYWRhcHQpIGJvdGggZGVzY3JpcHRpb25zPwo+Pj4KPj4+Cj4+Cj4+IEF0IHRoZSB0aW1lIHRo
ZSBwYXRjaCB3YXMgZG9uZSBpdCB3YXMgcmVhbGx5IGp1c3QgdXNlZCBieSBib290bG9hZGVycy4K
Pj4gQnV0IGFzIGl0IGlzIG5vdyB1c2VkIGluIHRoZSBkcml2ZXIgZm9yIGRlbGF5IGJsb2NrLCBJ
IHNob3VsZCByZW1vdmUgdGhlCj4+IHNlY29uZCBzZW50ZW5jZS4KPiAKPiBSZW1vdmUgYm90aC4K
PiAKPiBBZnRlciAiVGhpcyBkZWRpY2F0ZWQgY29tcGF0aWJsZSBpcyB1c2VkIGJ5IGJvb3Rsb2Fk
ZXJzIiB0aGVyZSBpcwo+IGFuIGltcGxpY2l0ICJpbiB0aGUgU0RLIHByb3ZpZGVkIGJ5IFNUIE1p
Y3JvZWxlY3Ryb25pY3MiLCBhbmQgdGhhdAo+IGlzIG9mIG5vIGNvbmNlcm4gZm9yIERUIGJpbmRp
bmdzLCB3aGljaCBhcmUgKHdlbGwsIGluIHRoZW9yeSkgdXNlZCBieQo+IGUuZy4gQlNEIG9yIG90
aGVyIG9wZXJhdGluZyBzeXN0ZW1zIGFuZCB3aG8ga25vd3Mgd2hhdCB0aGV5IHdpbGwKPiB1c2Ug
YW5kIG5vdCwgd2UgZG9uJ3QgcHV0IExpbnV4IHNwZWNpZmljcyBpbiB0aGVyZSwgbmVpdGhlciBC
b290Cj4gbG9hZGVyIHNwZWNpZmljcyBub3IgU1QgU0RLIHNwZWNpZmljcy4KPiAKPiBBdCBsZWFz
dCB0aGF0IGlzIHRoZSBsaXR0bGUgYnVyZWF1Y3JhdGljIGFtYml0aW9uIHdlIGhhdmUuCj4gCj4g
WW91cnMsCj4gTGludXMgV2FsbGVpagoKSGksCgpUaGFua3MgZm9yIGFsbCB0aGUgcmV2aWV3cy4K
SSdsbCB1cGRhdGUgdGhpcyBwYXRjaCBpbiB0aGUgdjIsIHJlbW92aW5nIGJvb3Rsb2FkZXIgbGlu
ZSBhbmQgdXNpbmcgZW51bS4KClVsZiwgc2hvdWxkIEkgc2VuZCB0aGUgbmV3IHNlcmllcyBub3cs
IG9yIGRvIHlvdSBwcmVmZXIgdG8gcmV2aWV3IHRoZSAKd2hvbGUgc2VyaWVzIGJlZm9yZT8KCgpZ
YW5uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
