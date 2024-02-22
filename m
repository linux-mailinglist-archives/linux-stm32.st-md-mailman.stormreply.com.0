Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1089185F517
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 10:55:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF15FC6B47A;
	Thu, 22 Feb 2024 09:55:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B19B7C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 09:55:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M56fhw010101; Thu, 22 Feb 2024 09:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=5OuU5m7TxwbK/rp6+K5E68Y6ra0FqJ05hWgHbe7cVJc=; b=O/
 GS/WZ5rs00m9jUJroN0OHjbBEIWTS5tyBjkIS7TsWomoy8qy9BYNfgqU2k/LMdfO
 d9RyobazqPT0HxO6AiOSt1OO0FrpaPUYBL3myR6I6BIlstC5mImQ3P1Z7KRbBW7o
 iOvMNdtcDWnt0+ddxihfFTNv4H1Pr+S7KFvHyLpnaHnPIe+xS00gN8zpUuk2ABwi
 46ni31THTP6jwms0K4i4SE4t5mq8xXP2er80zgUKRymNUMeHUe3qpKn/p+FJ7z0m
 bySlxh68sowiC9xl2510tmrOfoSfD0TUrXIF4TE8Jct2nyJoeCt1PYNcLA0nTHZi
 sjffwU9UyVsrT95BzGTA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdw13963a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 09:55:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41M9tIUx025649
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 09:55:18 GMT
Received: from [10.214.82.119] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 22 Feb
 2024 01:55:14 -0800
Message-ID: <8af59b01-53cf-4fc4-9946-6c630fb7b38e@quicinc.com>
Date: Thu, 22 Feb 2024 15:25:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jens
 Wiklander <jens.wiklander@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
 <fe4ec29f-7521-4369-a382-bae50dbf0ee5@quicinc.com>
 <adcf0c0d-f452-4285-8651-c147fcca001b@foss.st.com>
From: Naman Jain <quic_namajain@quicinc.com>
In-Reply-To: <adcf0c0d-f452-4285-8651-c147fcca001b@foss.st.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Yac_XNlh0Nv6ycv1GnJ3h6WLqaY_ujej
X-Proofpoint-GUID: Yac_XNlh0Nv6ycv1GnJ3h6WLqaY_ujej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_06,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402220078
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/7] Introduction of a remoteproc tee
 to load signed firmware
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

T24gMi8yMi8yMDI0IDI6MTcgUE0sIEFybmF1ZCBQT1VMSVFVRU4gd3JvdGU6Cj4gSGVsbG8gTmFt
YW4sCj4gCj4gT24gMi8yMi8yNCAwNjo0MywgTmFtYW4gSmFpbiB3cm90ZToKPj4gT24gMi8xNC8y
MDI0IDEwOjUxIFBNLCBBcm5hdWQgUG91bGlxdWVuIHdyb3RlOgo+Pj4gVXBkYXRlcyBmcm9tIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uIFsxXToKPj4+Cj4+PiBUaGlzIHZlcnNpb24gcHJvcG9zZXMgYW5v
dGhlciBhcHByb2FjaCBiYXNlZCBvbiBhbiBhbHRlcm5hdGUgbG9hZCBhbmQgYm9vdAo+Pj4gb2Yg
dGhlIGNvcHJvY2Vzc29yLiBUaGVyZWZvcmUsIHRoZSBjb25zdHJhaW50IGludHJvZHVjZWQgYnkg
dGVlX3JlbW90ZXByb2MKPj4+IGlzIHRoYXQgdGhlIGZpcm13YXJlIGhhcyB0byBiZSBhdXRoZW50
aWNhdGVkIGFuZCBsb2FkZWQgYmVmb3JlIHRoZSByZXNvdXJjZQo+Pj4gdGFibGUgY2FuIGJlIG9i
dGFpbmVkLgo+Pj4KPj4+IFRoZSBleGlzdGluZyBib290IHNlcXVlbmNlIGlzOiA+Cj4+PiAgwqDC
oCAxKSBHZXQgdGhlIHJlc291cmNlIHRhYmxlIGFuZCBzdG9yZSBpdCBpbiBhIGNhY2hlLAo+Pj4g
IMKgwqDCoMKgwqAgY2FsbGluZyBycHJvYy0+b3BzLT5wYXJzZV9mdygpLgo+Pj4gIMKgwqAgMikg
UGFyc2UgdGhlIHJlc291cmNlIHRhYmxlIGFuZCBoYW5kbGUgcmVzb3VyY2VzLAo+Pj4gIMKgwqDC
oMKgwqAgY2FsbGluZyBycHJvY19oYW5kbGVfcmVzb3VyY2VzLgo+Pj4gIMKgwqAgMykgTG9hZCB0
aGUgZmlybXdhcmUsIGNhbGxpbmcgcnByb2MtPm9wcy0+bG9hZCgpLgo+Pj4gIMKgwqAgNCkgU3Rh
cnQgdGhlIGZpcm13YXJlLCBjYWxsaW5nIHJwcm9jLT5vcHMtPnN0YXJ0KCkuCj4+PiAgwqAgPT4g
U3RlcHMgMSBhbmQgMiBhcmUgZXhlY3V0ZWQgaW4gcnByb2NfZndfYm9vdCgpLCB3aGlsZSBzdGVw
cyAzIGFuZCA0IGFyZQo+Pj4gIMKgwqDCoCBleGVjdXRlZCBpbiBycHJvY19zdGFydCgpLgo+Pj4g
PT4gdGhlIHVzZSBvZiBycHJvYy0+b3BzLT5sb2FkKCkgb3BzIGlzIG1hbmRhdG9yeQo+Pj4KPj4+
IFRoZSBib290IHNlcXVlbmNlIG5lZWRlZCBmb3IgVEVFIGJvb3QgaXM6Cj4+Pgo+Pj4gIMKgwqAg
MSkgTG9hZCB0aGUgZmlybXdhcmUuCj4+PiAgwqDCoCAyKSBHZXQgdGhlIGxvYWRlZCByZXNvdXJj
ZSwgbm8gY2FjaGUuCj4+PiAgwqDCoCAzKSBQYXJzZSB0aGUgcmVzb3VyY2UgdGFibGUgYW5kIGhh
bmRsZSByZXNvdXJjZXMuCj4+PiAgwqDCoCA0KSBTdGFydCB0aGUgZmlybXdhcmUuCj4+Cj4+IEhp
LAo+PiBXaGF0IHByb2JsZW0gYXJlIHdlIHJlYWxseSBhZGRyZXNzaW5nIGhlcmUgYnkgcmVvcmRl
cmluZyBsb2FkLCBwYXJzZSBvZgo+PiBGVyByZXNvdXJjZXM/Cj4gCj4gVGhlIGZlYXR1cmUgaW50
cm9kdWNlZCBpbiBURUUgaXMgdGhlIHNpZ25hdHVyZSBvZiB0aGUgZmlybXdhcmUgaW1hZ2VzLiBU
aGF0Cj4gbWVhbnMgdGhhdCBiZWZvcmUgZ2V0dGluZyB0aGUgcmVzb3VyY2UgdGFibGUsIHdlIG5l
ZWQgdG8gZmlyc3QgYXV0aGVudGljYXRlIHRoZQo+IGZpcm13YXJlIGltYWdlcy4KPiBBdXRoZW50
aWNhdGluZyBhIGZpcm13YXJlIGltYWdlIG1lYW5zIHRoYXQgd2UgaGF2ZSB0byBjb3B5IHRoZSBm
aXJtd2FyZSBpbnRvCj4gcHJvdGVjdGVkIG1lbW9yeSB0aGF0IGNhbm5vdCBiZSBjb3JydXB0ZWQg
YnkgdGhlIG5vbi1zZWN1cmUgYW5kIHRoZW4gdmVyaWZ5IHRoZQo+IHNpZ25hdHVyZS4KPiBUaGUg
c3RyYXRlZ3kgaW1wbGVtZW50ZWQgaW4gT1AtVEVFIGlzIHRvIGxvYWQgdGhlIGZpcm13YXJlIGlu
dG8gZGVzdGluYXRpb24KPiBtZW1vcnkgYW5kIHRoZW4gYXV0aGVudGljYXRlIGl0Lgo+IFRoaXMg
c3RyYXRlZ3kgYXZvaWRzIGhhdmluZyBhIHRlbXBvcmFyeSBjb3B5IG9mIHRoZSB3aG9sZSBpbWFn
ZXMgaW4gYSBzZWN1cmUgbWVtb3J5Lgo+IFRoaXMgc3RyYXRlZ3kgaW1wb3NlcyBsb2FkaW5nIHRo
ZSBmaXJtd2FyZSBpbWFnZXMgYmVmb3JlIHJldHJpZXZpbmcgdGhlIHJlc291cmNlCj4gdGFibGUu
Cj4gCj4+IEJhc2ljYWxseSwgd2hhdCBhcmUgdGhlIGxpbWl0YXRpb25zIG9mIHRoZSBjdXJyZW50
IGRlc2lnbiB5b3UgYXJlIHJlZmVycmluZyB0bz8KPj4gSSB1bmRlcnN0b29kIHRoYXQgVEVFIGlz
IGRlc2lnbmVkIHRoYXQgd2F5Lgo+IAo+IFRoZSBsaW1pdGF0aW9uIG9mIHRoZSBjdXJyZW50IGRl
c2lnbiBpcyB0aGF0IHdlIG9idGFpbiB0aGUgcmVzb3VyY2UgdGFibGUgYmVmb3JlCj4gbG9hZGlu
ZyB0aGUgZmlybXdhcmUuIEZvbGxvd2luZyB0aGUgY3VycmVudCBkZXNpZ24gd291bGQgaW1wb3Nl
IGNvbnN0cmFpbnRzIGluCj4gVEVFIHRoYXQgYXJlIG5vdCBzdHJhaWdodGZvcndhcmQuIFN0ZXAg
MSAoZ2V0dGluZyB0aGUgcmVzb3VyY2UgdGFibGUgYW5kIHN0b3JpbmcKPiBpdCBpbiBhIGNhY2hl
KSB3b3VsZCByZXF1aXJlIGhhdmluZyBhIGNvcHkgb2YgdGhlIHJlc291cmNlIHRhYmxlIGluIFRF
RSBhZnRlcgo+IGF1dGhlbnRpY2F0aW5nIHRoZSBpbWFnZXMuIEhvd2V2ZXIsIGF1dGhlbnRpY2F0
aW5nIHRoZSBmaXJtd2FyZSwgYXMgZXhwbGFpbmVkCj4gYmVmb3JlLCBkZXBlbmRzIG9uIHRoZSBz
dHJhdGVneSBpbXBsZW1lbnRlZC4gSW4gVEVFIGltcGxlbWVudGF0aW9uLCB3ZSBsb2FkIHRoZQo+
IGZpcm13YXJlIHRvIGF1dGhlbnRpY2F0ZSBpdCBpbiB0aGUgZGVzdGluYXRpb24gbWVtb3J5Lgo+
IAo+IFJlZ2FyZHMsCj4gQXJuYXVkCgoKSGVsbG8gQXJuYXVkLApJIHRoaW5rIG5vdyBJIGdvdCB5
b3VyIHBvaW50LiBJbiBURUUsIHlvdSBkb24ndCB3YW50IHRvIGRvIGFueXRoaW5nKHJlYWQKcmVz
b3VyY2UgdGFibGUpIHdpdGggRlcgaW1hZ2VzLCB1bnRpbCBpdHMgbG9hZGVkIGFuZCBhdXRoZW50
aWNhdGVkLgpTaW5jZSBjdXJyZW50IGRlc2lnbiB3YXMgbm90IGFsbG93aW5nIHlvdSB0byBkbyBp
dCwgeW91IGhhZCB0byAKcmVvcmdhbml6ZSB0aGUgY29kZSBzbyB0aGF0IHRoaXMgY2FuIGJlIGFj
aGlldmVkLgoKR2VuZXJhbGx5IHNwZWFraW5nLCBpbiBjdXJyZW50IGRlc2lnbiwgaWYgYXV0aGVu
dGljYXRpb24gZmFpbHMgZm9yIHNvbWUKcmVhc29uIGxhdGVyLCBvbmUgY2FuIGhhbmRsZSBpdCwg
YnV0IGl0IGRlcGVuZHMgb24gdGhlIGltcGxlbWVudGF0aW9uIG9mCnBhcnNlX2Z3IG9wIGlmIHRo
ZSBkYW1hZ2UgaXMgYWxyZWFkeSBkb25lLgoKUGxlYXNlIGNvcnJlY3QgbWUgaWYgdGhpcyBpcyB3
cm9uZyBhc3N1bXB0aW9uLgpQYXRjaCBsb29rcyBnb29kIHRvIG1lLgoKUmVnYXJkcywKTmFtYW4g
SmFpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
