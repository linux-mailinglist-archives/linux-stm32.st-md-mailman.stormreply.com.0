Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C239FB04C7F
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 01:41:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 702A5C3F92F;
	Mon, 14 Jul 2025 23:41:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58324C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 23:41:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGL5fC018725
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 14 Jul 2025 23:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=; b=cOogs6hZKzC35kE+
 Ei4d7dTfIKS+kLdyr+YXzjV1e202w3IiHFk7GE3C9VkxfXBMI0lxvB/6Qpx7IVzt
 lYV/5Zajz8+aDwtACN2aqgFjv79iTXy5Nxu/bquJKGEClJhaZOWYVqb2EB0npdin
 KdHoXwtCPj1aKqKs7J7ga6LYjBVCCHop2A5pYCglBzg+HqB8mZlKex0lenxeruFd
 /BWqWEJc87yXcuDNlXNKmUxFTMywZXgss+ULgcLGVvIufxHpbBeJ5kEHex9k8ltB
 ++86XwX1XNNcDyBgc0ytgON0ZWCLsyQBeUMkpYCxjpDVFh2hjgqPnby6i9SGi8BO
 QWjg2A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu864yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 23:41:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fabbaa1937so16846856d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 16:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752536511; x=1753141311;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VeRYeb70rL7zEXLABWVIX1u+Q+tiztEJvNfdb8INwvs=;
 b=DTTP/3gvDvyIpJcDulaVXvNW1qaLVGUTrhVHX8OtS73ZFtjd7KsH0OjlnobLMkw0h5
 pZoGskw8BhniB5u5i9IN/TfWhSWAC5KCesDvifGt8oq1DxSfOcNbkZVYyGQ4ARSrtIJH
 VcV+ofyMKoVmz/Ye3X5E7G0DWYAxgdvswVs+sW8Ew+VkIQIZV+MyzSFKFjeqFhxC13Nv
 v71W9G/k8cE4ncWIuSRVI6d/qBfKGViAmytEKjuJu6prLDp0Sx2uxmskx89ItxvD2jJS
 12+WUA5rE5V9auR2SfuKYmA0BEL6GmnyW7MZqEHC9iLm8BzYmLBo1PJmpoR7NjuR6XU+
 WJjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbQoawGoJaXPxKHhqCQdUYQVrsOi/F+XG5FIt7dwd69ntSyF1qhKAua8M6mriRhCqrz5J5dfoNLIxpIA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2p4Ht3RRvfIfX3e7mNp4bEtCldhsMGJzrq0Z7jjeUGsDjb9pb
 WE+RaAacROk+3uL/GQS5gP1o1ilu+jOa3y0QlXDEBhxRq2JG+rOTH1FhqviJspmwhtzV/dfGXNV
 B8Y72eDc/j3i7aSIKuofRtb0KEahNx0eEaIaOUuv+8vY8WCZxVB4xmirH/nov0An8j/lGI7VAcV
 9omgRY9OY=
X-Gm-Gg: ASbGncs3dc8ggJQxXNB1fEXnMWKA0Z4xiTu4NcQfEOGBI2tghyieWuvgDW96sgWkT9T
 0Wm4TOvgixc5hV3zFBFcftCrMj9cfYPhOZ5AAsKf7VSYGcOaXvmyWH8MXDdbTrO/rQK57c+mEW3
 fg/7kXU7IyELYZOnXClDjYRAnwhqI7Ky9zPb5LwN7tcSbDOceDGmjFCmaleVn6QQBswyN/S5V3K
 sXwqKIrycPGHjOXBSfbQDIRx5IqHZ5J8FhxR1UGrwbg2n7XG00OxmhOSPDFEqFTBMg5cOmEw0ed
 R0V1BQ80x7ih3i4c8OlGQIScBtG5OzcALSzmuJeh+dr8wEqJNqRNt5a6NDsIRpdfKkWcBfn5CQO
 98IiqZ2WUHTRwLZ6ikLoM
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id
 af79cd13be357-7dde99530b9mr793406085a.2.1752536510677; 
 Mon, 14 Jul 2025 16:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG7XfqmPDJb/D49KYu7FtbuASdqoalUiWXMFW7Y9kAKQLdst5o2Dt8cMYPxnLj3lAeTolOpQ==
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id
 af79cd13be357-7dde99530b9mr793403785a.2.1752536510136; 
 Mon, 14 Jul 2025 16:41:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e91d10sm893953766b.5.2025.07.14.16.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 16:41:49 -0700 (PDT)
Message-ID: <3ae51350-61a8-422c-8e39-32ea6d8b2e9a@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 01:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brian Masney <bmasney@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
 <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
 <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2OSBTYWx0ZWRfX4w2wbx/dOJfv
 xLhg3gay1+IAOIHaVHaVbC4jnbszHSRCvTdoXLQCgvCLt626wqa/HrKp1UjfFwnSG6PLlky0CLv
 dRvUtnWPEITLdiyir3HLREM4H+gfscFjNFktAiN5XVycA6D0t9cebwEMoo4HIL5g9N9m5IDbCxf
 bW6TMvOtLtl+tvawgB192mzjry1DaWH445O/zvM9by35l9SGJDFVpdEF4siWXzP+RnUYHLJ/j6t
 KVyCkh5R8fEr0XLeWU6QnI7B4SYVW1sngSUASQiTYO+ih8t25Xze+MHAzM8ct42cIXZJNeXX3Gi
 qVMjLAn1V3tYg3nMuMF+gIurhbvRJTPT/0H2ftxjiGUcofl3v8JkBfISiApAGipO+gu/6DD0You
 ejp2645nIHEPH+rw4UF8wgyKkGvGVuK2aoRrK9FdL+X2o4ddVkE3COdyR85mrHpx/ZdaqKKO
X-Proofpoint-ORIG-GUID: OWtHzlFMfmA6LcaeF1StnAc1S-_674lp
X-Proofpoint-GUID: OWtHzlFMfmA6LcaeF1StnAc1S-_674lp
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687595bf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=ICpbbQuAY509VL3I2goA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=719 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140169
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/6] sound: soc: qcom: qdsp6:
 q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
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

T24gNy8xNC8yNSAxMDozOSBQTSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IEhpIEtvbnJhZCwKPiAK
PiBPbiBUaHUsIEp1bCAxMCwgMjAyNSBhdCAxMjowOeKAr1BNIEtvbnJhZCBEeWJjaW8KPiA8a29u
cmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPj4gT24gNy8xMC8yNSA1OjUxIFBN
LCBCcmlhbiBNYXNuZXkgd3JvdGU6Cj4+PiBUaGUgcm91bmRfcmF0ZSgpIGNsayBvcHMgaXMgZGVw
cmVjYXRlZCwgc28gbWlncmF0ZSB0aGlzIGRyaXZlciBmcm9tCj4+PiByb3VuZF9yYXRlKCkgdG8g
ZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUgQ29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+Pj4g
b24gdGhlIGNvdmVyIGxldHRlciBvZiB0aGlzIHNlcmllcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pgo+PiBSZXZpZXdl
ZC1ieTogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPgo+Pgo+
PiBjb21lIHRvIHRoaW5rIG9mIGl0LCB0aGVyZSBhcmUgYSBsb3Qgb2YgZHJpdmVycyB0aGF0IGNh
biBub3QKPj4gZG8gYW55IHJhdGUgcm91bmRpbmcgLSBwZXJoYXBzIHdlIGNvdWxkIGludHJvZHVj
ZSBhIE5PUCBpbXBsZW1lbnRhdGlvbgo+PiBpbiB0aGUgY2xrIGNvcmUgdGhhdCB3ZSBjb3VsZCBy
ZWZlcmVuY2UsIGluc3RlYWQgb2YgY29weXBhc3RpbmcKPj4gaW50IGZvbyguLi4pIHsgInJldHVy
biAwIiB9Pwo+IAo+IEknbGwgbG9vayBhdCB0aGF0IGZvciBhIHNlY29uZCByb3VuZCBvZiBjbGVh
bnVwIG9uY2UgYWxsIG9mIHRoZQo+IHJvdW5kX3JhdGVzIGhhdmUgYmVlbiByZW1vdmVkIGZyb20g
dGhlIHRyZWUuIEZyb20gd2hhdCBJIHJlY2FsbCBhYm91dAo+IHRoZSB+MjAwIG9yIHNvIHJvdW5k
X3JhdGUgaW1wbGVtZW50YXRpb25zIGluIHRoZSBrZXJuZWwgdHJlZSwgdGhlcmUKPiB3ZXJlIG1h
eWJlIG9ubHkgNSBvciBzbyB0aGF0IGNvdmVyIHRoaXMgbm9vcCBjYXNlLiBRQyBzZWVtZWQgdG8g
aGF2ZQo+IHRoZSBtb3N0IGZyb20gd2hhdCBJIHJlY2FsbC4KPiAKPiBJdCB3b3VsZG4ndCBiZSBo
YXJkIHRvIG1ha2UgYSBDb2NjaW5lbGxlIHNjcmlwdCB0byBsb29rIGZvciB0aGUgbm9vcAo+IGRl
dGVybWluZV9yYXRlKCkgaW1wbGVtZW50YXRpb25zLgoKVGhhbmtzIQoKS29ucmFkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
