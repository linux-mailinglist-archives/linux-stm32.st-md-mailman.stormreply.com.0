Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7A39032E6
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 08:44:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F4DAC6C838;
	Tue, 11 Jun 2024 06:44:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D11ACFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 06:44:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B02Ku2016579;
 Tue, 11 Jun 2024 08:43:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 q8JK+u2uObSJN81tlPPbtHTFk/XuqwYf8cios9yw3NY=; b=XxpiP6H74g1pCFqu
 +ZzpDUGthw9L08wvN1dqX+eOysGbG4hBzDqZoJtvj+4+M8fclxQx0nhkUIRLrW5I
 ff/xJ3fgPCE6c8+Kk98XluN3gmlmrGBQrMNvewv+J0DUg6J7Eal+L2qLfRix68rq
 QysYRLwETt9gAJTFBbZ4szi3AgXqqxMPGAmUr+5Yqd9Gf5eb/xHiEdOuhmnGZZJp
 Bh7fo7yJYb0H9eXHueh33vGmExN4a1IWS3+QxnSXoA6yQ40fGIdBPZjH5BIeePhN
 sgDxKwgBhStMmcegraCHIQi9BeSnfLVnqzY94GQrSTpYlhfcDVZpowjMkZN7d7u7
 38NfFg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp4h71m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 08:43:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27E254002D;
 Tue, 11 Jun 2024 08:43:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C85220E1EF;
 Tue, 11 Jun 2024 08:42:38 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 08:42:35 +0200
Message-ID: <eea0ef13-58e9-4541-ac67-8246602b8e5d@foss.st.com>
Date: Tue, 11 Jun 2024 08:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240610071459.287500-1-christophe.roullier@foss.st.com>
 <20240610071459.287500-8-christophe.roullier@foss.st.com>
 <20139233-4e95-4fe5-84ca-734ee866afca@denx.de>
 <c5ea12e7-5ee6-4960-9141-e774ccd9977b@foss.st.com>
 <09105afe-1123-407a-96c3-2ea88602aad0@denx.de>
 <91af5c61-f23f-4f72-a8c8-f32b2c368768@foss.st.com>
 <bf3238fb-4fad-49b2-975c-e35d93cafe7c@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <bf3238fb-4fad-49b2-975c-e35d93cafe7c@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_02,2024-06-11_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH v6 7/8] net: stmmac: dwmac-stm32: Mask support for PMCR
 configuration
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

Ck9uIDYvMTAvMjQgMTk6MjksIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDYvMTAvMjQgMzo0OSBQ
TSwgQ2hyaXN0b3BoZSBST1VMTElFUiB3cm90ZToKPj4KPj4gT24gNi8xMC8yNCAxNTo0MywgTWFy
ZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA2LzEwLzI0IDE6NDUgUE0sIENocmlzdG9waGUgUk9VTExJ
RVIgd3JvdGU6Cj4+Pj4KPj4+PiBPbiA2LzEwLzI0IDEyOjM5LCBNYXJlayBWYXN1dCB3cm90ZToK
Pj4+Pj4gT24gNi8xMC8yNCA5OjE0IEFNLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+Pj4+
Pgo+Pj4+PiBbLi4uXQo+Pj4+Pgo+Pj4+Pj4gwqAgc3RhdGljIGludCBzdG0zMm1wMV9zZXRfbW9k
ZShzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgCj4+Pj4+PiAqcGxhdF9kYXQpCj4+Pj4+PiBA
QCAtMzAzLDcgKzMwNyw3IEBAIHN0YXRpYyBpbnQgc3RtMzJtY3Vfc2V0X21vZGUoc3RydWN0IAo+
Pj4+Pj4gcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0KQo+Pj4+Pj4gwqDCoMKgwqDCoCBk
ZXZfZGJnKGR3bWFjLT5kZXYsICJNb2RlICVzIiwgCj4+Pj4+PiBwaHlfbW9kZXMocGxhdF9kYXQt
Pm1hY19pbnRlcmZhY2UpKTsKPj4+Pj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJuIHJlZ21hcF91cGRh
dGVfYml0cyhkd21hYy0+cmVnbWFwLCByZWcsCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZHdtYWMtPm9wcy0+c3lzY2ZnX2V0aF9tYXNrLCB2YWwgPDwgMjMpOwo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNZU0NGR19NQ1VfRVRIX01BU0ss
IHZhbCA8PCAyMyk7Cj4+Pj4+PiDCoCB9Cj4+Pj4+PiDCoCDCoCBzdGF0aWMgdm9pZCBzdG0zMl9k
d21hY19jbGtfZGlzYWJsZShzdHJ1Y3Qgc3RtMzJfZHdtYWMgCj4+Pj4+PiAqZHdtYWMsIGJvb2wg
c3VzcGVuZCkKPj4+Pj4+IEBAIC0zNDgsOCArMzUyLDE1IEBAIHN0YXRpYyBpbnQgc3RtMzJfZHdt
YWNfcGFyc2VfZGF0YShzdHJ1Y3QgCj4+Pj4+PiBzdG0zMl9kd21hYyAqZHdtYWMsCj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoZHdtYWMtPnJlZ21hcCk7Cj4+Pj4+PiDC
oCDCoMKgwqDCoMKgIGVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAic3Qsc3lz
Y29uIiwgMSwgCj4+Pj4+PiAmZHdtYWMtPm1vZGVfcmVnKTsKPj4+Pj4+IC3CoMKgwqAgaWYgKGVy
cikKPj4+Pj4+ICvCoMKgwqAgaWYgKGVycikgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRl
dl9lcnIoZGV2LCAiQ2FuJ3QgZ2V0IHN5c2NvbmZpZyBtb2RlIG9mZnNldCAoJWQpXG4iLCAKPj4+
Pj4+IGVycik7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+Pj4+ICvCoMKg
wqAgfQo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCBkd21hYy0+bW9kZV9tYXNrID0gU1lTQ0ZHX01Q
MV9FVEhfTUFTSzsKPj4+Pj4+ICvCoMKgwqAgZXJyID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5k
ZXgobnAsICJzdCxzeXNjb24iLCAyLCAKPj4+Pj4+ICZkd21hYy0+bW9kZV9tYXNrKTsKPj4+Pj4+
ICvCoMKgwqAgaWYgKGVycikKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZGJnKGRldiwgIldh
cm5pbmcgc3lzY29uZmlnIHJlZ2lzdGVyIG1hc2sgbm90IHNldFxuIik7Cj4+Pj4+Cj4+Pj4+IElz
bid0IHRoaXMgYW4gZXJyb3IgLCBzbyBkZXZfZXJyKCkgPwo+Pj4+IE5vLCBpdCBpcyBvbmx5ICJ3
YXJuaW5nIiBpbmZvcm1hdGlvbiwgZm9yIE1QMSB0aGUgbWFzayBpcyBub3QgCj4+Pj4gbmVlZGVk
IChhbmQgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgaXMgbm90IHBsYW5uZWQgdG8gcHV0IG1h
c2sgCj4+Pj4gcGFyYW1ldGVyIG1hbmRhdG9yeSkKPj4+Cj4+PiBTaG91bGQgdGhpcyBiZSBhbiBl
cnJvciBmb3IgYW55dGhpbmcgbmV3ZXIgdGhhbiBNUDE1IHRoZW4gPwo+PiBGb3IgTVAyNSwgbm8g
bmVlZCBvZiBtYXNrLCBzbyBmb3IgbW9tZW50IGl0IGlzIHNwZWNpZmljIHRvIE1QMTMuCj4KPiBN
YWtlIHRoaXMgYSB3YXJuaW5nIGZvciBNUDE1LCBlcnJvciBmb3IgTVAxMywgZG8gbm90IGNoZWNr
IHN0LHN5c2NvbiAKPiBwcmVzZW5jZSBmb3IgTVAyIGF0IGFsbC4gV291bGQgdGhhdCB3b3JrID8K
T2sgSSB3aWxsIG1ha2UgYSB3YXJuaW5nIGZvciBNUDE1IGFuZCBNUDI1IGFuZCBlcnJvciBmb3Ig
TVAxMy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
