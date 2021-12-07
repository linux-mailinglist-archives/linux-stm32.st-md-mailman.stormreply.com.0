Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8DF46B625
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 09:37:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70CC9C5F1E5;
	Tue,  7 Dec 2021 08:37:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82270C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 08:37:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B71xGYE003241;
 Tue, 7 Dec 2021 09:36:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=H0RdRCe9r35PH+cGUXxi9Pl2iNpVWrQNSlKDf0Qq5Es=;
 b=NvG3SuPeVcHYMcUeywekfq3HEmNKckXki3QFqjwo5j2iCxmHh+ejD0gONJP3i3bhIgSw
 PGmdB7kd3x8Ky6l0jdO8skFJBO6NkrxthUb0VDUv2Nuu6IvvmuBySHpG5cilXczGabTV
 FpODdM7kCWITkNDme980XZl+Xlf+VXHxqydS7IY2AwlB7MNNxEPOInZXm7d2+J3/mdW4
 9vAxrj7aKuJskNutuKpIv4JySZZ80LFH3JZhMlXtMMm6L8TtO5BDhkJJdq3hZ+WJOvoT
 ZYK4OuurVc908Q59eB5aTLNLeLcehGABMLqWBpNAwrWq/IuzyS3HgukkeV55uz/2/vza LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3csmx0kuf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:36:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 090A610002A;
 Tue,  7 Dec 2021 09:36:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2ED62265EF;
 Tue,  7 Dec 2021 09:36:50 +0100 (CET)
Received: from [10.211.7.5] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 7 Dec
 2021 09:36:49 +0100
To: Rob Herring <robh@kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Saenz Julienne <nsaenzjulienne@suse.de>
References: <20211206174133.2296265-1-robh@kernel.org>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <0bfd3425-77f6-e00b-e7f9-581917c6dc99@foss.st.com>
Date: Tue, 7 Dec 2021 09:36:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211206174133.2296265-1-robh@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Patrick DELAUNAY-SCND-02 <patrick.delaunay@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: Add missing 'reg'
	property
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

T24gMTIvNi8yMSA2OjQxIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiBXaXRoICd1bmV2YWx1YXRl
ZFByb3BlcnRpZXMnIHN1cHBvcnQgaW1wbGVtZW50ZWQsIHRoZSBmb2xsb3dpbmcgd2FybmluZ3MK
PiBhcmUgZ2VuZXJhdGVkIGluIHRoZSBudm1lbSBleGFtcGxlczoKPiAKPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0uZXhhbXBsZS5kdC55YW1s
OiBlZnVzZUAxZmZmNzgwMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQg
KCdyZWcnIHdhcyB1bmV4cGVjdGVkKQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9udm1lbS9ybWVtLmV4YW1wbGUuZHQueWFtbDogbnZyYW1AMTAwMDAwMDA6IFVuZXZhbHVhdGVk
IHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgncmVnJyB3YXMgdW5leHBlY3RlZCkKPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYnJjbSxudnJhbS5leGFtcGxlLmR0
LnlhbWw6IG52cmFtQDFlZmYwMDAwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxs
b3dlZCAoJ3JlZycgd2FzIHVuZXhwZWN0ZWQpCj4gCj4gQWRkIHRoZSBtaXNzaW5nICdyZWcnIHBy
b3BlcnR5IGRlZmluaXRpb24uCj4gCj4gQ2M6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFz
LmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KPiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4u
c3RtMzJAZ21haWwuY29tPgo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3Vl
QGZvc3Muc3QuY29tPgo+IENjOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4g
Q2M6IFNhZW56IEp1bGllbm5lIDxuc2FlbnpqdWxpZW5uZUBzdXNlLmRlPgo+IENjOiBGYWJyaWNl
IEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPiBDYzogbGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYnJj
bSxudnJhbS55YW1sICAgICB8IDMgKysrCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS9ybWVtLnlhbWwgICAgICAgICAgIHwgMyArKysKPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3N0LHN0bTMyLXJvbWVtLnlhbWwgfCAzICsrKwo+ICAz
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKSGkgUm9iLAoKRm9yIHRoZSBzdG0zMi1y
b21lbSwgeW91IGNhbiBhZGQgbXk6CgpSZXZpZXdlZC1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJy
aWNlLmdhc25pZXJAZm9zcy5zdC5jb20+CgpUaGFua3MsCkZhYnJpY2UKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2JyY20sbnZyYW0ueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9icmNtLG52cmFtLnlh
bWwKPiBpbmRleCA1OGZmNmIwYmRiMWEuLjhjM2YwY2QyMjgyMSAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYnJjbSxudnJhbS55YW1sCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2JyY20sbnZyYW0ueWFt
bAo+IEBAIC0yNCw2ICsyNCw5IEBAIHByb3BlcnRpZXM6Cj4gICAgY29tcGF0aWJsZToKPiAgICAg
IGNvbnN0OiBicmNtLG52cmFtCj4gIAo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+
ICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gIAo+ICBleGFtcGxlczoKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3JtZW0ueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9ybWVtLnlhbWwKPiBpbmRl
eCAxZDg1YTBhMzA4NDYuLmE0YTc1NWRjZmM0MyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vcm1lbS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3JtZW0ueWFtbAo+IEBAIC0xOSw2ICsxOSw5IEBA
IHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAtIHJhc3BiZXJyeXBpLGJvb3Rsb2FkZXItY29uZmln
Cj4gICAgICAgIC0gY29uc3Q6IG52bWVtLXJtZW0KPiAgCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRl
bXM6IDEKPiArCj4gICAgbm8tbWFwOgo+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvZmxhZwo+ICAgICAgZGVzY3JpcHRpb246Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9zdCxzdG0zMi1yb21lbS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3N0LHN0bTMyLXJvbWVtLnlh
bWwKPiBpbmRleCBhNDhjOGZhNTZiY2UuLjQ0OGEyNjc4ZGM2MiAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0ueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9zdCxzdG0zMi1y
b21lbS55YW1sCj4gQEAgLTI0LDYgKzI0LDkgQEAgcHJvcGVydGllczoKPiAgICAgICAgLSBzdCxz
dG0zMmY0LW90cAo+ICAgICAgICAtIHN0LHN0bTMybXAxNS1ic2VjCj4gIAo+ICsgIHJlZzoKPiAr
ICAgIG1heEl0ZW1zOiAxCj4gKwo+ICBwYXR0ZXJuUHJvcGVydGllczoKPiAgICAiXi4qQFswLTlh
LWZdKyQiOgo+ICAgICAgdHlwZTogb2JqZWN0Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
