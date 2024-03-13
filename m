Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A887B49F
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 23:52:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5298AC6B46B;
	Wed, 13 Mar 2024 22:52:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30DFAC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 22:52:19 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42DLvbOk027157; Wed, 13 Mar 2024 22:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=jMWRMbYIZO6Y6crhunSlTLQWHGSrabz5NP2clR8Lzyg=; b=Oo
 1BkIWfF5BgnNE5erj2KzvK5P+JuEwBGFIvCrt1oZmJouOaIkAt/ut4+LkTvha3ZY
 zcitRhWsD989nVr1OvjtDHsMLidGPFkLsBITSxc2c8A4cs3wOcCGSoUWbMywpFCW
 BXQSK0AUS5kORIAatZgMPoIozG9E3andaAWyv0eJzJBrfvN5+ktshIqcBkk94eGE
 9AZWlhJMNvsCQ447ZIdIRrvB9K5No+1iyFVhoIRQjsybcDR477Hltjb5QvJ5FFIN
 V9UHH5twxJHdSX6w3R6pMufWGdywphC6pZng0+mYDtaEVbvP5vgHGYhMW43xd0PG
 HpDwtkwNhbVGoFrp5ffg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wu9xaspgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 22:51:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DMpCRs004527
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 22:51:12 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 15:51:11 -0700
Message-ID: <f0492c92-1015-48e3-bfce-598c7a4843d1@quicinc.com>
Date: Wed, 13 Mar 2024 15:51:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, James Prestwood <prestwoj@gmail.com>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
 <20240313194423.GA1111@sol.localdomain>
 <b838e729-dc30-4e18-b928-c34c16b08606@gmail.com>
 <20240313202223.GB1111@sol.localdomain>
 <db86cba4-0e61-441d-8e66-405a13b61a3c@gmail.com>
 <20240313221043.GC1111@sol.localdomain>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240313221043.GC1111@sol.localdomain>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: EQ1oBcAKVVr6392XzSXRR2wEAfpYrNcm
X-Proofpoint-GUID: EQ1oBcAKVVr6392XzSXRR2wEAfpYrNcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130174
Cc: linux-wireless@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Karel Balej <balejk@matfyz.cz>, dhowells@redhat.com, mcgrof@kernel.org,
 keyrings@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-modules@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 iwd@lists.linux.dev, davem@davemloft.net, dimitri.ledkov@canonical.com,
 linux-crypto@vger.kernel.org
Subject: Re: [Linux-stm32] [REGRESSION] Re: [PATCH] crypto: pkcs7: remove
	sha1 support
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

T24gMy8xMy8yMDI0IDM6MTAgUE0sIEVyaWMgQmlnZ2VycyB3cm90ZToKPiBPbiBXZWQsIE1hciAx
MywgMjAyNCBhdCAwMjoxNzoyOVBNIC0wNzAwLCBKYW1lcyBQcmVzdHdvb2Qgd3JvdGU6Cj4+IEhp
LAo+Pgo+PiBPbiAzLzEzLzI0IDE6MjIgUE0sIEVyaWMgQmlnZ2VycyB3cm90ZToKPj4+IE9uIFdl
ZCwgTWFyIDEzLCAyMDI0IGF0IDAxOjEyOjU0UE0gLTA3MDAsIEphbWVzIFByZXN0d29vZCB3cm90
ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIDMvMTMvMjQgMTI6NDQgUE0sIEVyaWMgQmlnZ2VycyB3
cm90ZToKPj4+Pj4gT24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMTA6MjY6MDZBTSAtMDcwMCwgSmFt
ZXMgUHJlc3R3b29kIHdyb3RlOgo+Pj4+Pj4gSGksCj4+Pj4+Pgo+Pj4+Pj4gT24gMy8xMy8yNCAx
OjU2IEFNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+Pj4+Pj4+IE5vdCBzdXJlIHdoeSB5b3UncmUg
Q0MnaW5nIHRoZSB3b3JsZCwgYnV0IEkgZ3Vlc3MgYWRkaW5nIGEgZmV3IG1vcmUKPj4+Pj4+PiBk
b2Vzbid0IGh1cnQgLi4uCj4+Pj4+Pj4KPj4+Pj4+PiBPbiBXZWQsIDIwMjQtMDMtMTMgYXQgMDk6
NTAgKzAxMDAsIEthcmVsIEJhbGVqIHdyb3RlOgo+Pj4+Pj4+PiAgICAgYW5kIEkgdXNlIGl3ZAo+
Pj4+Pj4+IFRoaXMgaXMgeW91ciBwcm9ibGVtLCB0aGUgd2lyZWxlc3Mgc3RhY2sgaW4gdGhlIGtl
cm5lbCBkb2Vzbid0IHVzZSBhbnkKPj4+Pj4+PiBrZXJuZWwgY3J5cHRvIGNvZGUgZm9yIDgwMi4x
WC4KPj4+Pj4+IFllcywgdGhlIHdpcmVsZXNzIHN0YWNrIGhhcyB6ZXJvIGJlYXJpbmcgb24gdGhl
IGlzc3VlLiBJIHRoaW5rIHRoYXQncyB3aGF0Cj4+Pj4+PiB5b3UgbWVhbnQgYnkgInByb2JsZW0i
Lgo+Pj4+Pj4KPj4+Pj4+IElXRCBoYXMgdXNlZCB0aGUga2VybmVsIGNyeXB0byBBUEkgZm9yZXZl
ciB3aGljaCB3YXMgYWJydXB0bHkgYnJva2VuLCB0aGF0Cj4+Pj4+PiBpcyB0aGUgcHJvYmxlbS4K
Pj4+Pj4+Cj4+Pj4+PiBUaGUgb3JpZ2luYWwgY29tbWl0IHNheXMgaXQgd2FzIHRvIHJlbW92ZSBz
dXBwb3J0IGZvciBzaGExIHNpZ25lZCBrZXJuZWwKPj4+Pj4+IG1vZHVsZXMsIGJ1dCBpdCBkaWQg
bW9yZSB0aGFuIHRoYXQgYW5kIGJyb2tlIHRoZSBrZXljdGwgQVBJLgo+Pj4+Pj4KPj4+Pj4gV2hp
Y2ggc3BlY2lmaWMgQVBJIGlzIGl3ZCB1c2luZyB0aGF0IGlzIHJlbGV2YW50IGhlcmU/Cj4+Pj4+
IEkgY2xvbmVkIGh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9uZXR3b3Jr
L3dpcmVsZXNzL2l3ZAo+Pj4+PiBhbmQgZ3JlcHBlZCBmb3Iga2V5Y3RsIGFuZCBBRl9BTEcsIGJ1
dCB0aGVyZSBhcmUgbm8gbWF0Y2hlcy4KPj4+PiBJV0QgdXNlcyBFTEwgZm9yIGl0cyBjcnlwdG8s
IHdoaWNoIHVzZXMgdGhlIEFGX0FMRyBBUEk6Cj4+Pj4KPj4+PiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGlicy9lbGwvZWxsLmdpdC8KPj4+IFRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0
IHRoYXQgdGhlIHJlbGV2YW50IGNvZGUgaXMgcmVhbGx5IGluIHRoYXQgc2VwYXJhdGUKPj4+IHJl
cG9zaXRvcnkuICBOb3RlLCBpdCBzZWVtcyB0aGF0IGtleWN0bCgpIGlzIHRoZSBwcm9ibGVtIGhl
cmUsIG5vdCBBRl9BTEcuICBUaGUKPj4+IGJsYW1lZCBjb21taXQgZGlkbid0IGNoYW5nZSBhbnl0
aGluZyBmb3IgQUZfQUxHLgo+Pj4KPj4+PiBJIGJlbGlldmUgdGhlIGZhaWx1cmUgaXMgd2hlbiBj
YWxsaW5nOgo+Pj4+Cj4+Pj4gS0VZQ1RMX1BLRVlfUVVFUlkgZW5jPSJ4OTYyIiBoYXNoPSJzaGEx
Igo+Pj4+Cj4+Pj4gIEZyb20gbG9ncyBNaWNoYWVsIHBvc3RlZCBvbiB0aGUgSVdEIGxpc3QsIHRo
ZSBFTEwgQVBJIHRoYXQgZmFpbHMgaXM6Cj4+Pj4KPj4+PiBsX2tleV9nZXRfaW5mbyAoZWxsLmdp
dC9lbGwva2V5LmM6NDE2KQo+Pj4gT2theSwgSSBndWVzcyB0aGF0J3Mgd2hhdCdzIGFjdHVhbGx5
IGNhdXNpbmcgdGhlIHByb2JsZW0uICBLRVlDVExfUEtFWV8qIGFyZSBhCj4+PiB3ZWlyZCBzZXQg
b2YgQVBJcyB3aGVyZSB1c2Vyc3BhY2UgY2FuIGFzayB0aGUga2VybmVsIHRvIGRvIGFzeW1tZXRy
aWMga2V5Cj4+PiBvcGVyYXRpb25zLiAgSXQncyB1bmNsZWFyIHdoeSB0aGV5IGV4aXN0LCBhcyB0
aGUgc2FtZSBmdW5jdGlvbmFsaXR5IGlzIGF2YWlsYWJsZQo+Pj4gaW4gdXNlcnNwYWNlIGNyeXB0
byBsaWJyYXJpZXMuCj4+Pgo+Pj4gSSBzdXBwb3NlIHRoYXQgdGhlIGJsYW1lZCBjb21taXQsIG9y
IGF0IGxlYXN0IHBhcnQgb2YgaXQsIHdpbGwgbmVlZCB0byBiZQo+Pj4gcmV2ZXJ0ZWQgdG8ga2Vl
cCB0aGVzZSB3ZWlyZCBrZXljdGxzIHdvcmtpbmcuCj4+Pgo+Pj4gRm9yIHRoZSBmdXR1cmUsIHdo
eSBkb2Vzbid0IGl3ZCBqdXN0IHVzZSBhIHVzZXJzcGFjZSBjcnlwdG8gbGlicmFyeSBzdWNoIGFz
Cj4+PiBPcGVuU1NMPwo+Pgo+PiBJIHdhcyBub3QgYXJvdW5kIHdoZW4gdGhlIG9yaWdpbmFsIGRl
Y2lzaW9uIHdhcyBtYWRlLCBidXQgYSBmZXcgcmVhc29ucyBJCj4+IGtub3cgd2UgZG9uJ3QgdXNl
IG9wZW5TU0w6Cj4+Cj4+IMKgLSBJV0QgaGFzIHZpcnR1YWxseSB6ZXJvIGRlcGVuZGVuY2llcy4K
PiAKPiBEZXBlbmRpbmcgb24gc29tZXRoaW5nIGluIHRoZSBrZXJuZWwgZG9lcyBub3QgZWxpbWlu
YXRlIGEgZGVwZW5kZW5jeTsgaXQganVzdAo+IGFkZHMgdGhhdCBwYXJ0aWN1bGFyIGtlcm5lbCBV
QVBJIHRvIHlvdXIgbGlzdCBvZiBkZXBlbmRlbmNpZXMuICBUaGUgcmVhc29uIHRoYXQKPiB3ZSdy
ZSBoYXZpbmcgdGhpcyBkaXNjdXNzaW9uIGluIHRoZSBmaXJzdCBwbGFjZSBpcyBiZWNhdXNlIGl3
ZCBpcyBkZXBlbmRpbmcgb24KPiBhbiBvYnNjdXJlIGtlcm5lbCBVQVBJIHRoYXQgaXMgbm90IHdl
bGwgZGVmaW5lZC4gIEhpc3RvcmljYWxseSBpdCdzIGJlZW4gaGFyZCB0bwo+IGF2b2lkICJicmVh
a2luZyIgY2hhbmdlcyBpbiB0aGVzZSBjcnlwdG8tcmVsYXRlZCBVQVBJcyBiZWNhdXNlIG9mIHRo
ZSBwb29yCj4gZGVzaWduIHdoZXJlIGEgaHVnZSBudW1iZXIgb2YgYWxnb3JpdGhtcyBhcmUgcG90
ZW50aWFsbHkgc3VwcG9ydGVkLCBidXQgdGhlIGxpc3QKPiBpcyB1bmRvY3VtZW50ZWQgYW5kIGl0
IHZhcmllcyBmcm9tIG9uZSBzeXN0ZW0gdG8gYW5vdGhlciBiYXNlZCBvbiBjb25maWd1cmF0aW9u
Lgo+IEFsc28gZHVlIHRvIHRoZWlyIG9ic2N1cml0eSBtYW55IGtlcm5lbCBkZXZlbG9wZXJzIGRv
bid0IGtub3cgdGhhdCB0aGVzZSBVQVBJcwo+IGV2ZW4gZXhpc3QuICAoVGhlIHJlYWN0aW9uIHdo
ZW4gc29tZW9uZSBmaW5kcyBvdXQgaXMgdXN1YWxseSAiV2h5IT8iKQo+IAo+IEl0IG1heSBiZSB3
b3J0aCBsb29raW5nIGF0IGlmIGl3ZCBzaG91bGQgbWFrZSBhIGRpZmZlcmVudCBjaG9pY2UgZm9y
IHRoaXMKPiBkZXBlbmRlbmN5LiAgSXQncyB1bmRlcnN0YW5kYWJsZSB0byBibGFtZSBkZXBlbmRl
bmNpZXMgd2hlbiB0aGluZ3MgZ28gd3JvbmcsIGJ1dAo+IGF0IHRoZSBzYW1lIHRpbWUgdGhlIGNo
b2ljZSBvZiBkZXBlbmRlbmN5IGlzIHZlcnkgbXVjaCBhIGNob2ljZSwgYW5kIHNvbWUKPiBjaG9p
Y2VzIGNhbiBiZSBtb3JlIHRlY2huaWNhbGx5IHNvdW5kIGFuZCBjYXVzZSBmZXdlciBwcm9ibGVt
cyB0aGFuIG90aGVycy4uLgo+IAo+PiDCoC0gT3BlblNTTCArIGZyaWVuZHMgYXJlIHJhdGhlciBs
YXJnZSBsaWJyYXJpZXMuCj4gCj4gVGhlIExpbnV4IGtlcm5lbCBpcyBhbHNvIGxhcmdlLCBhbmQg
aXQncyBtYWRlIGxhcmdlciBieSBoYXZpbmcgdG8gc3VwcG9ydAo+IG9ic29sZXRlIGNyeXB0byBh
bGdvcml0aG1zIGZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aXRoIGl3ZC4KPiAKPj4gwqAt
IEFGX0FMRyBoYXMgdHJhbnNwYXJlbnQgaGFyZHdhcmUgYWNjZWxlcmF0aW9uIChub3Qgc3VyZSBp
ZiBvcGVuU1NMIGRvZXMKPj4gdG9vKS4KPiAKPiBPcGVuU1NMIHRha2VzIGFkdmFudGFnZSBvZiBD
UFUtYmFzZWQgaGFyZHdhcmUgYWNjZWxlcmF0aW9uLCBlLmcuIEFFUy1OSS4KPiAKPj4gQW5vdGhl
ciBjb25zaWRlcmF0aW9uIGlzIG9uY2UgeW91IHN1cHBvcnQgb3BlblNTTCBzb21lb25lIHdhbnRz
IHdvbGZTU0wsCj4+IHRoZW4gYm9yaW5nU1NMIGV0Yy4gRXZlbiBpZiB1c2VycyBpbXBsZW1lbnQg
c3VwcG9ydCBpdCBqdXN0IGJlY29tZXMgYSBodWdlCj4+IGJ1cmRlbiB0byBjYXJyeSBmb3IgdGhl
IHByb2plY3QuIEp1c3QgbG9vayBhdCB3cGFfc3VwcGxpY2FudCdzIHNyYy9jcnlwdG8vCj4+IGZv
bGRlciwgbmVhcmx5IDQwayBMT0MgaW4gdGhlcmUsIGNvbXBhcmVkIHRvIEVMTCdzIGNyeXB0byBt
b2R1bGVzIHdoaWNoIGlzCj4+IH41ay4gWW91IGhhdmUgdG8gc29ydCBvdXQgYWxsIHRoZSBuaXR0
eSBncml0dHkgZGV0YWlscyBvZiBlYWNoIGxpYnJhcnksIGFuZAo+PiBwcm92aWRlIGEgY29tbW9u
IGRyaXZlci9BUEkgZm9yIHRoZSBjb3JlIGNvZGUsIGRpZmZlcmVuY2VzIGJldHdlZW4gb3BlbnNz
bAo+PiB2ZXJzaW9ucywgdGhlIGxpc3QgZ29lcyBvbi4KPiAKPiBXaGF0IGlzIHRoZSBzcGVjaWZp
YyBmdW5jdGlvbmFsaXR5IHRoYXQgeW91J3JlIGFjdHVhbGx5IHJlbHlpbmcgb24gdGhhdCB5b3UK
PiB0aGluayB3b3VsZCBuZWVkIDQwSyBsaW5lcyBvZiBjb2RlIHRvIHJlcGxhY2UsIGV2ZW4gdXNp
bmcgT3BlblNTTD8gIEkgc2VlIHlvdQo+IGFyZSB1c2luZyBLRVlDVExfUEtFWV8qLCBidXQgd2hh
dCBzcGVjaWZpY2FsbHkgYXJlIHlvdSB1c2luZyB0aGVtIGZvcj8gIFdoYXQKPiBvcGVyYXRpb25z
IGFyZSBiZWluZyBwZXJmb3JtZWQsIGFuZCB3aXRoIHdoaWNoIGFsZ29yaXRobXMgYW5kIGtleSBm
b3JtYXRzPwo+IEFsc28sIGlzIHRoZSBrZXJuZWwgYmVoYXZpb3IgdGhhdCB5b3UncmUgcmVseWlu
ZyBvbiBkb2N1bWVudGVkIGFueXdoZXJlPyAgVGhlcmUKPiBhcmUgbWFuIHBhZ2VzIGZvciB0aG9z
ZSBrZXljdGxzLCBidXQgdGhleSBkb24ndCBzYXkgYW55dGhpbmcgYWJvdXQgYW55Cj4gcGFydGlj
dWxhciBoYXNoIGFsZ29yaXRobSwgU0hBLTEgb3Igb3RoZXJ3aXNlLCBiZWluZyBzdXBwb3J0ZWQu
Cgo8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBKzU1YUZ4VzdOTUFNdlloa3Z6MVVQYlVU
VUpld1J0NlliNTFRQXg1UnRyV093amViZ0BtYWlsLmdtYWlsLmNvbS8+CiJBbmQgd2Ugc2ltcGx5
IGRvIG5vdCBicmVhayB1c2VyIHNwYWNlLiIKLUxpbnVzIFRvcnZhbGRzCgpJcyB0aGlzIG5vIGxv
bmdlciBhcHBsaWNhYmxlPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
