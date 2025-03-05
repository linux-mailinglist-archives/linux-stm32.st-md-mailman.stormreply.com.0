Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4AA4F3F9
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 02:40:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 871EDC78F6D;
	Wed,  5 Mar 2025 01:40:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59984CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 01:40:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NA3GP022009;
 Wed, 5 Mar 2025 01:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u9vvkvyV4t5XH40aBxvK8nQrrgwumF6fOch6vU0Td0k=; b=hnpSOT8o8cUUub4d
 5g+BxaD/H+jCy93jgyKHX9i/9tAySMmKIbTkGUX0B68KBm2JSdwqrbWByuauU44G
 GXQAJHalZo2tD80F/joslbM6SwXIi5fZmX8eICoBX6KicDxkxQ5Tf2oFKuEAJHFz
 xXR6t8Ihq9e8MZ4fqBZlhd230FrcF90hvYD6S6rUIqzEPsuTV2Xsk7xNmKPwpeUN
 UgF1G3ljvCseW1FHfub4G92B4SR9NwlTSZbbt/mlO8gnwm3m7MUYUvIDnAUKN5GQ
 OJwbkgsbK2+RyFAGE8FyI1aK8RUCuZckWl9U7SVniy9ws/ut0oBBMUjtkXHx0Thd
 H1DZ9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t3rgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Mar 2025 01:39:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5251drEg032134
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Mar 2025 01:39:53 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 17:39:48 -0800
Message-ID: <2ab83252-fe17-489c-b103-28ce769123a3@quicinc.com>
Date: Wed, 5 Mar 2025 09:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-10-quic_jiegan@quicinc.com>
 <1b05e832-6d41-463a-a52a-6ff340d0d6f8@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <1b05e832-6d41-463a-a52a-6ff340d0d6f8@arm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: olhOWdusO9i-OZhGYmJNpEUPDrL-OFAR
X-Authority-Analysis: v=2.4 cv=P5XAhjAu c=1 sm=1 tr=0 ts=67c7ab69 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=73M6xUdCWGYtzQJonWAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: olhOWdusO9i-OZhGYmJNpEUPDrL-OFAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_01,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=846 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050011
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v15 09/10] Coresight: Add Coresight TMC
 Control Unit driver
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

CgpPbiAzLzQvMjAyNSAxMDo1OSBQTSwgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKPiBPbiAwMy8w
My8yMDI1IDAzOjI5LCBKaWUgR2FuIHdyb3RlOgo+PiBUaGUgQ29yZXNpZ2h0IFRNQyBDb250cm9s
IFVuaXQgaG9zdHMgbWlzY2VsbGFuZW91cyBjb25maWd1cmF0aW9uIAo+PiByZWdpc3RlcnMKPj4g
d2hpY2ggY29udHJvbCB2YXJpb3VzIGZlYXR1cmVzIHJlbGF0ZWQgdG8gVE1DIEVUUiBzaW5rLgo+
Pgo+PiBCYXNlZCBvbiB0aGUgdHJhY2UgSUQsIHdoaWNoIGlzIHByb2dyYW1tZWQgaW4gdGhlIHJl
bGF0ZWQgQ1RDVSBBVElECj4+IHJlZ2lzdGVyIG9mIGEgc3BlY2lmaWMgRVRSLCB0cmFjZSBkYXRh
IHdpdGggdGhhdCB0cmFjZSBJRCBnZXRzIGludG8KPj4gdGhlIEVUUiBidWZmZXIsIHdoaWxlIG90
aGVyIHRyYWNlIGRhdGEgZ2V0cyBkcm9wcGVkLgo+Pgo+PiBFbmFibGluZyBzb3VyY2UgZGV2aWNl
IHNldHMgb25lIGJpdCBvZiB0aGUgQVRJRCByZWdpc3RlciBiYXNlZCBvbgo+PiBzb3VyY2UgZGV2
aWNlJ3MgdHJhY2UgSUQuCj4+IERpc2FibGluZyBzb3VyY2UgZGV2aWNlIHJlc2V0cyB0aGUgYml0
IGFjY29yZGluZyB0byB0aGUgc291cmNlCj4+IGRldmljZSdzIHRyYWNlIElELgo+Pgo+PiBSZXZp
ZXdlZC1ieTogSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGxpbmFyby5vcmc+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEppZSBHYW4gPHF1aWNfamllZ2FuQHF1aWNpbmMuY29tPgo+IAo+IC4uLgo+IAo+PiAt
LS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2ln
aHQtY3RjdS5oCj4+IEBAIC0wLDAgKzEsMzkgQEAKPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkgKi8KPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjQtMjAy
NSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgCj4+IHJpZ2h0cyByZXNlcnZl
ZC4KPj4gKyAqLwo+PiArCj4+ICsjaWZuZGVmIF9DT1JFU0lHSFRfQ1RDVV9ICj4+ICsjZGVmaW5l
IF9DT1JFU0lHSFRfQ1RDVV9ICj4+ICsjaW5jbHVkZSAiY29yZXNpZ2h0LXRyYWNlLWlkLmgiCj4+
ICsKPj4gKy8qIE1heGltdW0gbnVtYmVyIG9mIHN1cHBvcnRlZCBFVFIgZGV2aWNlcyBmb3IgYSBz
aW5nbGUgQ1RDVS4gKi8KPj4gKyNkZWZpbmUgRVRSX01BWF9OVU3CoMKgwqDCoCAyCj4+ICsKPiAK
PiBXQVJOSU5HOiBwbGVhc2UsIG5vIHNwYWNlIGJlZm9yZSB0YWJzCj4gIzQxMzogRklMRTogZHJp
dmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGN1Lmg6MTE6Cj4gKyNkZWZpbmUg
RVRSX01BWF9OVU0gXkkyJAo+IAo+IHRvdGFsOiAwIGVycm9ycywgMiB3YXJuaW5ncywgMzk3IGxp
bmVzIGNoZWNrZWQKPiAKPiBBbm90aGVyIGNoZWNrcGF0Y2ggd2FybmluZy4gUGxlYXNlIHRha2Ug
Y2FyZSBpbiB0aGUgZnV0dXJlLgo+IAo+IFN1enVraQoKSGkgU3V6dWtpLAoKR290IGl0LiBXaWxs
IHRha2UgY2FyZSBpbiB0aGUgZnV0dXJlLiBUaGFua3MgZm9yIGhlbHAgdG8gZGVhbCB3aXRoIHRo
ZW0gCnRoaXMgdGltZS4KCkppZQoKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
