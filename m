Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A550E6F8
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 19:21:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAD38C60462;
	Mon, 25 Apr 2022 17:21:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66221C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 17:21:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PBOxh9026633;
 Mon, 25 Apr 2022 19:21:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Aleh7166rh9D1CmXqz7MI/E+eg7HPpeG/MxMJeFQSsM=;
 b=kJsqvJYBRQqqU9XDdwl18vaz1jVFYpTYb47kTfUsHumkTHAzWJibNIrpmP/txG+L7YEq
 3+EH0khKDBLVO6d+JqbJetuBXOaf4wi+mtuVdby3YU04bg1VcDIyCNp3NAcXmtnr7gUv
 p6HVC9c9cYVHgB/pFhcyUHiSEp58LTAii4nMbLG9imoBcutlztv6X3JVUuVr+apeegP6
 kKG/P67N7fjo1RLpftCaIC3aqN10pyKysadS+xCqoDUag2FMtV09ygCksyhnqhXtWCda
 y/yyURSLZhzQfoyp3l7uMzy4XL7qGN5yfHrjjcnWI+mme1xbbZJTZJldA6gTKdJB4LVi kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm6k92fqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 19:21:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE57410002A;
 Mon, 25 Apr 2022 19:21:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A982524551E;
 Mon, 25 Apr 2022 19:21:19 +0200 (CEST)
Received: from [10.211.4.234] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 25 Apr
 2022 19:21:18 +0200
Message-ID: <c8f0436d-3389-04bb-089d-aca4b4d8d7fd@foss.st.com>
Date: Mon, 25 Apr 2022 19:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <arnd@arndb.de>, <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, <soc@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-2-alexandre.torgue@foss.st.com>
 <7d365d28-66ac-93d4-72b5-87d0b36ba017@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <7d365d28-66ac-93d4-72b5-87d0b36ba017@denx.de>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_09,2022-04-25_03,2022-02-23_01
Cc: etienne.carriere@st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/8] dt-bindings: rcc: Add optional
 external ethernet RX clock properties
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

SGkgTWFyZWsKCk9uIDQvMjIvMjIgMTg6MjgsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQvMjIv
MjIgMTc6MDksIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+IEZyb206IE1hcmVrIFZhc3V0IDxt
YXJleEBkZW54LmRlPgo+Pgo+PiBEZXNjcmliZSBvcHRpb25hbCBleHRlcm5hbCBldGhlcm5ldCBS
WCBjbG9jayBpbiB0aGUgRFQgYmluZGluZwo+PiB0byBmaXggZHRic19jaGVjayB3YXJuaW5ncyBs
aWtlOgo+Pgo+PiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUzYy1kaGNvbS1kcmMwMi5kdC55
YW1sOiByY2NANTAwMDAwMDA6IAo+PiAnYXNzaWduZWQtY2xvY2stcGFyZW50cycsICdhc3NpZ25l
ZC1jbG9jay1yYXRlcycsICdhc3NpZ25lZC1jbG9ja3MnLCAKPj4gJ2Nsb2NrLW5hbWVzJywgJ2Ns
b2NrcycgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0rJwo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gQ2M6IEFs
ZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+IENjOiBHYWJy
aWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20+Cj4+IENjOiBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+PiBUbzogZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmcKPj4gQWNrZWQtYnk6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBm
b3NzLnN0LmNvbT4KPj4KPj4gZGlmZiAtLWdpdCAKPj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDEtcmNjLnlhbWwgCj4+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAxLXJjYy55YW1sCj4+IGluZGV4
IGEwYWU0ODY3ZWQyNy4uN2EyNTEyNjQ1ODJkIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDEtcmNjLnlhbWwKPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAxLXJjYy55
YW1sCj4+IEBAIC01OSw2ICs1OSwxNCBAQCBwcm9wZXJ0aWVzOgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gc3Qsc3RtMzJtcDEtcmNjCj4+IMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHN5c2Nv
bgo+PiArwqAgY2xvY2tzOgo+PiArwqDCoMKgIGRlc2NyaXB0aW9uOgo+PiArwqDCoMKgwqDCoCBT
cGVjaWZpZXMgdGhlIGV4dGVybmFsIFJYIGNsb2NrIGZvciBldGhlcm5ldCBNQUMuCj4+ICvCoMKg
wqAgbWF4SXRlbXM6IDEKPj4gKwo+PiArwqAgY2xvY2stbmFtZXM6Cj4+ICvCoMKgwqAgY29uc3Q6
IEVUSF9SWF9DTEsvRVRIX1JFRl9DTEsKPj4gKwo+PiDCoMKgwqAgcmVnOgo+PiDCoMKgwqDCoMKg
IG1heEl0ZW1zOiAxCj4gCj4gU2hvdWxkIHRoaXMgcGF0Y2ggYmUgcGFydCBvZiB0aGlzIHNlcmll
cywgbWF5YmUgdGhpcyB3YXMgcmUtc2VudCBieSAKPiBhY2NpZGVudCA/CgpOb3QgYnkgYWNjaWRl
bnQuIEFzIHlvdXIgcGF0Y2ggaXMgYWxyZWFkeSBtZXJnZWQgaW4gUm9iIHRyZWUgKEkgZ3Vlc3Mp
LCAKSSBhZGRlZCBpdCBpbiB0aGlzIHNlcmllcyB0byBhdm9pZCBtZXJnZSBjb25mbGljdCBsYXRl
ci4gSSBhZGRlZCBhIGxhdGUgCm5vdGUgaW4gdGhlIGNvdmVyLWxldHRlci4KCnJlZ2FyZHMKYWxl
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
