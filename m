Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD429EC76
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 14:07:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B62BBC3FAD5;
	Thu, 29 Oct 2020 13:07:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16696C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 13:07:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TD75Uv017707
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 29 Oct 2020 14:07:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=KLI8B2cTZ3V6nTRcGvfAkyWcZGoE4/SBo5cApBFRN+Q=;
 b=h2hHxIhO0md8MoZ1DFzJoArnZY/cnza7+gFJ6JSvR9rdQSK9Z7ZT/gg0w93zAc3/m6gS
 AhwL5HUcdzTMuvoYkPgAySBJOKe1RDUnkF58NLS0/5qx01bODjBcVCIz1SjXlubSdPyN
 Os/GQutO+x+mobzWtWXa2g3x0iaAKgBiEMscVu7E5r3MFIEWGZGtzAG8vG6siU2vv9S9
 NXEARo3I2yrhdhgndLuYKAB0hnYq44tjDSTQZn+u32nNK92EKmpW0d9DiXJQ1y4HI2L6
 jOMD6SfT8fr2d7s8EtOEBzcPut/1LCrhGO+7TzGkofwTkhKx+mkmjwZJ7gZ14oOjwiE3 fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf40crd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 29 Oct 2020 14:07:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 06CFD10002A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 14:07:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F050D2B91CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 14:07:08 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 14:07:08 +0100
To: <linux-stm32@st-md-mailman.stormreply.com>
References: <20201029100647.233361-1-coiby.xu@gmail.com>
 <20201029100647.233361-6-coiby.xu@gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <117a3942-234f-b471-c42d-03398aba73f1@st.com>
Date: Thu, 29 Oct 2020 14:07:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029100647.233361-6-coiby.xu@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_06:2020-10-29,
 2020-10-29 signatures=0
Subject: Re: [Linux-stm32] [PATCH 6/9] mfd: stmfx: remove unnecessary
 CONFIG_PM_SLEEP
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

SGksCgpPbiAxMC8yOS8yMCAxMTowNiBBTSwgQ29pYnkgWHUgd3JvdGU6Cj4gU0lNUExFX0RFVl9Q
TV9PUFMgaGFzIGFscmVhZHkgdG9vayBnb29kIGNhcmUgb2YgQ09ORklHX1BNX0NPTkZJRy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDb2lieSBYdSA8Y29pYnkueHVAZ21haWwuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9tZmQvc3RtZnguYyB8IDIgLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zdG1meC5jIGIvZHJpdmVycy9tZmQv
c3RtZnguYwo+IGluZGV4IDVlNjgwYmZkZjVjOS4uZTc2MGNmMmJlMDJlIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbWZkL3N0bWZ4LmMKPiArKysgYi9kcml2ZXJzL21mZC9zdG1meC5jCj4gQEAgLTQ2
OSw3ICs0NjksNiBAQCBzdGF0aWMgaW50IHN0bWZ4X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50KQo+ICAgCXJldHVybiBzdG1meF9jaGlwX2V4aXQoY2xpZW50KTsKPiAgIH0KPiAgIAo+
IC0jaWZkZWYgQ09ORklHX1BNX1NMRUVQCj4gICBzdGF0aWMgaW50IHN0bWZ4X3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQo+ICAgewo+ICAgCXN0cnVjdCBzdG1meCAqc3RtZnggPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKPiBAQCAtNTM1LDcgKzUzNCw2IEBAIHN0YXRpYyBpbnQgc3RtZnhfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAgfQo+IC0jZW5k
aWYKClRoaXMgZ2VuZXJhdGVzIHdhcm5pbmdzIHdoZW4gQ09ORklHX1BNX1NMRUVQPW4gYW5kIGJ1
aWxkIHdpdGggVz0xOgpkcml2ZXJzL21mZC9zdG1meC5jOjQ5NjoxMjogd2FybmluZzog4oCYc3Rt
ZnhfcmVzdW1l4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIApbLVd1bnVzZWQtZnVuY3Rpb25dCiAg
IDQ5NiB8IHN0YXRpYyBpbnQgc3RtZnhfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKICAgICAg
IHwgICAgICAgICAgICBefn5+fn5+fn5+fn4KZHJpdmVycy9tZmQvc3RtZnguYzo0NzI6MTI6IHdh
cm5pbmc6IOKAmHN0bWZ4X3N1c3BlbmTigJkgZGVmaW5lZCBidXQgbm90IAp1c2VkIFstV3VudXNl
ZC1mdW5jdGlvbl0KICAgNDcyIHwgc3RhdGljIGludCBzdG1meF9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKICAgICAgIHwgICAgICAgICAgICBefn5+fn5+fn5+fn5+CgpZb3UgbXVzdCBhZGQg
YSBfX21heWJlX3VudXNlZC4KClJlZ2FyZHMsCkFtZWxpZQoKPiAgIAo+ICAgc3RhdGljIFNJTVBM
RV9ERVZfUE1fT1BTKHN0bWZ4X2Rldl9wbV9vcHMsIHN0bWZ4X3N1c3BlbmQsIHN0bWZ4X3Jlc3Vt
ZSk7Cj4gICAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
