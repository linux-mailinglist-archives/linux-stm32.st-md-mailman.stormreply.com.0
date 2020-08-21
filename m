Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E524D04D
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 10:06:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28FA6C3FAD8;
	Fri, 21 Aug 2020 08:06:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 315A9C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 08:06:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07L82JJr002831; Fri, 21 Aug 2020 10:06:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=th7iteinfJ5v35Fs8Ofjskmkk4fXfBSVgD7G2rq8Rbw=;
 b=vB2upX7yZQWJVaoHeJvA3i5JRJJufz9ih3al4Dd9JKa2GMqA5VyPqnnFOF/r/X/W+jq+
 /kmqWUqSs25OkbIl/0JXNogFpSWe0waYNiCVIFCWS/KSHWtBNlg9svjcCQYXXlJUo1eV
 fa/9BtjoTwvZVcAmNoSi8pbnGbmTxXOqGJDY69vN+jKP8y2jNagCcrMVtBwL8TC3vTP2
 ZJBly60IK16ZzesyuJ6jOLtTjEDi/qMUfgLxcSmeCPxoyKAMcUwMQkH4lS1JtLS2Auy4
 NF8DPTL+9fIINFL3zMJSQpZHdDe92fTw/Jr3lT0fm3maRnF4lyA9h3Lg/b//YdcdrAoc gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 330jg7nrvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 10:06:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D0F310002A;
 Fri, 21 Aug 2020 10:06:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DBE721FE90;
 Fri, 21 Aug 2020 10:06:17 +0200 (CEST)
Received: from [10.48.1.149] (10.75.127.45) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Aug
 2020 10:06:16 +0200
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Support Opensource
 <support.opensource@diasemi.com>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
References: <20200821111135.0b958d3a@xhacker.debian>
 <20200821111943.29b2b4ca@xhacker.debian>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <98a8224e-9797-cbd0-7a99-972f3c6db292@st.com>
Date: Fri, 21 Aug 2020 10:06:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821111943.29b2b4ca@xhacker.debian>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-21_06:2020-08-19,
 2020-08-21 signatures=0
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 14/15] regulator: stm32-booster: Fix
 W=1 build warning when CONFIG_OF=n
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

T24gOC8yMS8yMCA1OjE5IEFNLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IEZpeCBiZWxvdyB3YXJu
aW5nIHdoZW4gQ09ORklHX09GPW46Cj4gCj4gZHJpdmVycy9yZWd1bGF0b3Ivc3RtMzItYm9vc3Rl
ci5jOjEwNDozNDogd2FybmluZzog4oCYc3RtMzJfYm9vc3Rlcl9vZl9tYXRjaOKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICAgMTA0IHwgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfYm9vc3Rlcl9vZl9tYXRjaFtdID0gewo+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPEppc2hlbmcuWmhhbmdA
c3luYXB0aWNzLmNvbT4KCkhpIEppc2hlbmcsCgpBY2tlZC1ieTogRmFicmljZSBHYXNuaWVyIDxm
YWJyaWNlLmdhc25pZXJAc3QuY29tPgoKVGhhbmtzIGZvciB0aGUgcGF0Y2gsCkZhYnJpY2UKPiAt
LS0KPiAgZHJpdmVycy9yZWd1bGF0b3Ivc3RtMzItYm9vc3Rlci5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9yZWd1bGF0b3Ivc3RtMzItYm9vc3Rlci5jIGIvZHJpdmVycy9yZWd1bGF0b3Ivc3Rt
MzItYm9vc3Rlci5jCj4gaW5kZXggMDNmMTYyZmZkMTQ0Li4zMTM2ZWE4YTM1ZDUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9yZWd1bGF0b3Ivc3RtMzItYm9vc3Rlci5jCj4gKysrIGIvZHJpdmVycy9y
ZWd1bGF0b3Ivc3RtMzItYm9vc3Rlci5jCj4gQEAgLTEwMSw3ICsxMDEsNyBAQCBzdGF0aWMgaW50
IHN0bTMyX2Jvb3N0ZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXJl
dHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0z
Ml9ib29zdGVyX29mX21hdGNoW10gPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIF9fbWF5YmVfdW51c2VkIHN0bTMyX2Jvb3N0ZXJfb2ZfbWF0Y2hbXSA9IHsKPiAgCXsKPiAg
CQkuY29tcGF0aWJsZSA9ICJzdCxzdG0zMmg3LWJvb3N0ZXIiLAo+ICAJCS5kYXRhID0gKHZvaWQg
Kikmc3RtMzJoN19ib29zdGVyX2Rlc2MKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
