Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52078706CFD
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 17:38:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B8CEC6B442;
	Wed, 17 May 2023 15:38:14 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9A38C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 15:38:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B3D8846BF;
 Wed, 17 May 2023 17:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684337893;
 bh=M2eZPFSQ41Q2D5uOI+yQoYDb47PQYn5beh6o3SR5YPU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yj+yFxg/67nXD6F8KdjGNlHeJUvviQO5I5ySKPLO/v3UuNNeAQbbAQon1X4iYoFH+
 4ng+9TJsrfKE3Ri/aRLHPEd28tFXh0dw8+94gAYvLhuN2k3MsRBjDYN9/zy9BwEJTM
 j0BwNM9pp2jMIaGjsGL3n+LqWMcKZ0R0OSN3e7jf014CyrDIAXaMQqkYCCarukQE8n
 gAow4a/1AB+IYMC93ztJlaa6MI5oUPyvpbtsqOmVFZf4qMxcldl463dSI9mgLvtDhc
 74pLarpGSdMH/IpdCsBMWblZJ+J3RIo5DcqfaRZWGbPoCdP7/Rq0gbuyVQ9GgZGE2h
 GpuGffaI6X3tw==
Message-ID: <dc5fae3e-28e8-92eb-612e-ee447d6eebfa@denx.de>
Date: Wed, 17 May 2023 17:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517132214.254757-1-raphael.gallais-pou@foss.st.com>
 <56bcad63-a32e-63fc-1c20-15909f2788b5@denx.de>
 <c617bb64-e7fd-c3de-6e29-6dd7c5896d16@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c617bb64-e7fd-c3de-6e29-6dd7c5896d16@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] STM32 warning cleanup
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

T24gNS8xNy8yMyAxNjozOCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPiAKPiBPbiA1LzE3
LzIzIDE2OjA2LCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gNS8xNy8yMyAxNToyMiwgUmFwaGFl
bCBHYWxsYWlzLVBvdSB3cm90ZToKPj4+IFRoaXMgc2VyaWUgYWltcyB0byByZWR1Y2UgdGhlIG51
bWJlciBvZiBkZXZpY2UtdHJlZSB3YXJuaW5ncyBvZgo+Pj4gZm9sbG93aW5nIGJvYXJkcyA6Cj4+
Pgo+Pj4gIMKgwqAgLSBTVE0zMkY0MjktRElTQ08KPj4+ICDCoMKgIC0gU1RNMzJNUDE1Kgo+Pj4K
Pj4+IFRob3NlIHdhcm5pbmdzIHdlcmUgYXBwZWFyaW5nIGVpdGhlciBkdXJpbmcgYnVpbGQgb3Ig
d2hlbiBjaGVja2luZwo+Pj4gZHQtYmluZGluZ3MgYW5kIGNvbmNlcm4gbW9zdGx5IExUREMgYW5k
IERTSSBJUHMgYW5kIHdlcmUgZHVlIHRvIHRoZQo+Pj4gZm9sbG93aW5nIGNhc2VzOgo+Pj4KPj4+
ICDCoMKgIC0gcGFuZWwtZHNpQDAgbm9kZXMgdGhhdCBuZWVkZWQKPj4+ICDCoMKgIC0gdW5uZWNl
c3NhcnkgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIHByb3BlcnRpZXMKPj4+ICDCoMKg
IC0gcmVzaWR1YWwgJ3JlZycgZmllbGQgb24gc2luZ2xlIGVuZHBvaW50cwo+Pj4KPj4+IFJhcGhh
ZWwgR2FsbGFpcy1Qb3UgKDMpOgo+Pj4gIMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBmaXggd2Fybmlu
Z3Mgb24gc3RtMzJmNDY5LWRpc2NvIGJvYXJkCj4+PiAgwqDCoCBkdC1iaW5kaW5nczogZGlzcGxh
eTogc3Qsc3RtMzItZHNpOiBSZW1vdmUgdW5uZWNlc3NhcnkgZmllbGRzCj4+PiAgwqDCoCBBUk06
IGR0czogc3RtMzI6IGZpeCBzZXZlcmFsIERUIHdhcm5pbmdzIG9uIHN0bTMybXAxNQo+Pj4KPj4+
ICDCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWRzaS55YW1swqDC
oMKgwqDCoCB8wqAgMiAtLQo+Pj4gIMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQ2OS1kaXNj
by5kdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KPj4+ICDC
oCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUxLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDUgLS0tLS0KPj4+ICDCoCBhcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTU3LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDcgLS0tLS0tLQo+Pj4gIMKgIC4uLi9kdHMvc3RtMzJtcDE1N2EtaWNvcmUtc3RtMzJt
cDEtY3RvdWNoMi1vZjEwLmR0c8KgwqDCoCB8wqAgNiArKysrLS0KPj4+ICDCoCAuLi4vYm9vdC9k
dHMvc3RtMzJtcDE1N2EtaWNvcmUtc3RtMzJtcDEtZWRpbW0yLjIuZHRzwqDCoCB8wqAgNiArKysr
LS0KPj4+ICDCoCAuLi4vc3RtMzJtcDE1N2EtbWljcm9nZWEtc3RtMzJtcDEtbWljcm9kZXYyLjAt
b2Y3LmR0c8KgIHzCoCAzICstLQo+Pj4gIMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdj
LWRrMi5kdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4ICsrKysrKysr
Cj4+PiAgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0c8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrKysrLS0tCj4+PiAgwqAgYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1N2MtbHhhLW1jMS5kdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMyArLS0KPj4+ICDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1h
dmVuZ2VyOTYuZHRzacKgwqDCoMKgIHzCoCA2ICstLS0tLQo+Pj4gIMKgIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNXh4LWRreC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDMgKy0tCj4+PiAgwqAgMTIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMzQg
ZGVsZXRpb25zKC0pCj4+Pgo+Pgo+PiBJcyB0aGlzIGEgVjIgc2VyaWVzID8KPiAKPiBIaSBNYXJl
awo+IAo+IAo+IHllcyBpdCB3YXMsCj4gCj4gVGhhbmtzIGZvciBoaWdobGlnaHRpbmcgaXQgdG8g
bWUuCgpZb3UncmUgd2VsY29tZSwgSSBzZWUgYSBWMyBub3csIHRoYW5rcyAhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
