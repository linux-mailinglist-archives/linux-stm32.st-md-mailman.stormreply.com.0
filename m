Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B78A2CB21
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 19:24:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 468B7C78025;
	Fri,  7 Feb 2025 18:24:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 244AFC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 18:24:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517CT9pQ010620;
 Fri, 7 Feb 2025 18:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 24vCB/Znf/TjzLM/rAbzJHPouiMnIdlOj3IaBxZTHOA=; b=E03V5WVdh1fY1DbW
 yBGjR8ooUk49Udw8Yr32oTNz88DdkkXzhfc4KbaBHW/INhjp6UGF0M5G/UAg7bCw
 S9AiqmeMDOSlhBQUMBp8rA+fLZOH2c+u9MLB6qy37fUeKdiH9NmFOFgkMGU+hXRk
 DQ90WmK62P4xV7Tryte3Dsuus4bSV2YEXKbDFX16lYR+nWN8WkgwZVffiKtWFxjA
 7vIqKvZ8015aTGkRDpuxE/TxwPNdNgi0HySfB75yl/t+FCk+wuvIdgrQga1jFG+v
 IjE2AbkHni6qP2AtopA/KGwkaBJieEKSxxwV7Wz90tGNC4+Kj8I+EbZm1kgg8gc2
 E4gLFg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nj6w8v2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Feb 2025 18:21:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517ILXDi023451
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Feb 2025 18:21:33 GMT
Received: from [10.110.91.228] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 10:21:32 -0800
Message-ID: <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
Date: Fri, 7 Feb 2025 10:21:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 <netdev@vger.kernel.org>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OOmFY7SmVHmL41lJG0u5sLFBwJ4eloTj
X-Proofpoint-GUID: OOmFY7SmVHmL41lJG0u5sLFBwJ4eloTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=832 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502070137
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/5] net: stmmac: Add PCI
 driver support for BCM8958x
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

CgpPbiAxMS81LzIwMjQgODoxMiBBTSwgSml0ZW5kcmEgVmVnaXJhanUgd3JvdGU6Cj4gSGkgbmV0
ZGV2IHRlYW0sCj4gCj4gT24gRnJpLCBPY3QgMTgsIDIwMjQgYXQgMTo1M+KAr1BNIDxqaXRlbmRy
YS52ZWdpcmFqdUBicm9hZGNvbS5jb20+IHdyb3RlOgo+Pgo+PiBGcm9tOiBKaXRlbmRyYSBWZWdp
cmFqdSA8aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tPgo+Pgo+PiBUaGlzIHBhdGNoc2V0
IGFkZHMgYmFzaWMgUENJIGV0aGVybmV0IGRldmljZSBkcml2ZXIgc3VwcG9ydCBmb3IgQnJvYWRj
b20KPj4gQkNNODk1OHggQXV0b21vdGl2ZSBFdGhlcm5ldCBzd2l0Y2ggU29DIGRldmljZXMuCj4+
Cj4+IFRoaXMgU29DIGRldmljZSBoYXMgUENJZSBldGhlcm5ldCBNQUMgYXR0YWNoZWQgdG8gYW4g
aW50ZWdyYXRlZCBldGhlcm5ldAo+PiBzd2l0Y2ggdXNpbmcgWEdNSUkgaW50ZXJmYWNlLiBUaGUg
UENJZSBldGhlcm5ldCBjb250cm9sbGVyIGlzIHByZXNlbnRlZCB0bwo+PiB0aGUgTGludXggaG9z
dCBhcyBQQ0kgbmV0d29yayBkZXZpY2UuCj4+Cj4+IFRoZSBmb2xsb3dpbmcgYmxvY2sgZGlhZ3Jh
bSBnaXZlcyBhbiBvdmVydmlldyBvZiB0aGUgYXBwbGljYXRpb24uCj4+ICAgICAgICAgICAgICAr
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Kwo+PiAgICAgICAgICAgICAgfCAgICAg
ICBIb3N0IENQVS9MaW51eCAgICAgICAgICAgIHwKPj4gICAgICAgICAgICAgICs9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0rCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHx8IFBD
SWUKPj4gICAgICAgICAgICAgICAgICAgICAgICAgfHwKPj4gICAgICAgICArPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Kwo+PiAgICAgICAgIHwgICAgICAgICAgICst
LS0tLS0tLS0tLS0tLSsgICAgICAgICAgICAgICB8Cj4+ICAgICAgICAgfCAgICAgICAgICAgfCBQ
Q0lFIEVuZHBvaW50fCAgICAgICAgICAgICAgIHwKPj4gICAgICAgICB8ICAgICAgICAgICB8IEV0
aGVybmV0ICAgICB8ICAgICAgICAgICAgICAgfAo+PiAgICAgICAgIHwgICAgICAgICAgIHwgQ29u
dHJvbGxlciAgIHwgICAgICAgICAgICAgICB8Cj4+ICAgICAgICAgfCAgICAgICAgICAgfCAgIERN
QSAgICAgICAgfCAgICAgICAgICAgICAgIHwKPj4gICAgICAgICB8ICAgICAgICAgICArLS0tLS0t
LS0tLS0tLS0rICAgICAgICAgICAgICAgfAo+PiAgICAgICAgIHwgICAgICAgICAgIHwgICBNQUMg
ICAgICAgIHwgICBCQ004OTU4WCAgICB8Cj4+ICAgICAgICAgfCAgICAgICAgICAgKy0tLS0tLS0t
LS0tLS0tKyAgIFNvQyAgICAgICAgIHwKPj4gICAgICAgICB8ICAgICAgICAgICAgICAgfHwgWEdN
SUkgICAgICAgICAgICAgICAgICAgfAo+PiAgICAgICAgIHwgICAgICAgICAgICAgICB8fCAgICAg
ICAgICAgICAgICAgICAgICAgICB8Cj4+ICAgICAgICAgfCAgICAgICAgICAgKy0tLS0tLS0tLS0t
LS0tKyAgICAgICAgICAgICAgIHwKPj4gICAgICAgICB8ICAgICAgICAgICB8IEV0aGVybmV0ICAg
ICB8ICAgICAgICAgICAgICAgfAo+PiAgICAgICAgIHwgICAgICAgICAgIHwgc3dpdGNoICAgICAg
IHwgICAgICAgICAgICAgICB8Cj4+ICAgICAgICAgfCAgICAgICAgICAgKy0tLS0tLS0tLS0tLS0t
KyAgICAgICAgICAgICAgIHwKPj4gICAgICAgICB8ICAgICAgICAgICAgIHx8IHx8IHx8IHx8ICAg
ICAgICAgICAgICAgICAgfAo+PiAgICAgICAgICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0rCj4+ICAgICAgICAgICAgICAgICAgICAgICB8fCB8fCB8fCB8fCBNb3Jl
IGV4dGVybmFsIGludGVyZmFjZXMKPj4KPj4gVGhlIE1BQyBibG9jayBvbiBCQ004OTU4eCBpcyBi
YXNlZCBvbiBTeW5vcHNpcyBYR01BQyA0LjAwYSBjb3JlLiBUaGlzCj4+IE1BQyBJUCBpbnRyb2R1
Y2VzIG5ldyBETUEgYXJjaGl0ZWN0dXJlIGNhbGxlZCBIeXBlci1ETUEgZm9yIHZpcnR1YWxpemF0
aW9uCj4+IHNjYWxhYmlsaXR5Lgo+Pgo+PiBEcml2ZXIgZnVuY3Rpb25hbGl0eSBzcGVjaWZpYyB0
byBuZXcgTUFDIChEVzI1R01BQykgaXMgaW1wbGVtZW50ZWQgaW4KPj4gbmV3IGZpbGUgZHcyNWdt
YWMuYy4KPj4KPj4gTWFuYWdlbWVudCBvZiBpbnRlZ3JhdGVkIGV0aGVybmV0IHN3aXRjaCBvbiB0
aGlzIFNvQyBpcyBub3QgaGFuZGxlZCBieQo+PiB0aGUgUENJZSBpbnRlcmZhY2UuCj4+IFRoaXMg
U29DIGRldmljZSBoYXMgUENJZSBldGhlcm5ldCBNQUMgZGlyZWN0bHkgYXR0YWNoZWQgdG8gYW4g
aW50ZWdyYXRlZAo+PiBldGhlcm5ldCBzd2l0Y2ggdXNpbmcgWEdNSUkgaW50ZXJmYWNlLgo+Pgo+
PiB2NS0+djY6Cj4+ICAgIENoYW5nZSBzdW1tYXJ5IHRvIGFkZHJlc3MgY29tbWVudHMvc3VnZ2Vz
dGlvbnMgYnkgU2VyZ2UgU2VtaW4uCj4+ICAgIFBhdGNoMToKPj4gICAgICBSZW1vdmVkIHRoZSBj
b21sZXhpdHkgb2YgaGRtYSBtYXBwaW5nIGluIHByZXZpb3VzIHBhdGNoIHNlcmllcyBhbmQKPj4g
ICAgICB1c2Ugc3RhdGljIERNQSBtYXBwaW5nLgo+PiAgICAgIFJlbmFtZWQgcGxhdF9zdG1tYWNl
bmV0X2RhdGE6OnNucHNfZGV2X2lkIGFzIGRldl9pZCBhbmQgbW92ZWQgdG8KPj4gICAgICB0aGUg
YmVnaW5uaW5nIG9mIHRoZSBzdHJ1Y3QuCj4+ICAgIFBhdGNoMjoKPj4gICAgICBBZGRlZCBkdzI1
Z21hY19nZXRfaHdfZmVhdHVyZSgpIGZvciBkdzI1Z21hYy4KPj4gICAgICBVc2Ugc3RhdGljIG9u
ZS10by1vbmUgVkRNQS1UQy1QRE1BIG1hcHBpbmcuCj4+ICAgIFBhdGNoNDoKPj4gICAgICBSZW1v
dmUgdXNhZ2Ugb2YgcGxhdF9zdG1tYWNlbmV0X2RhdGE6Om1zaV8qX3ZlYyB2YXJpYWJsZXMgZm9y
Cj4+ICAgICAgaW50ZXJydXB0IHZlY3RvciBpbml0aWFsaXphdGlvbi4KPj4gICAgICBDaGFuZ2Ug
cGh5X2ludGVyZmFjZSB0eXBlIHRvIFhHTUlJLgo+PiAgICAgIENsZWFudXAgdW51c2VkIG1hY3Jv
cy4KPj4KPiAKPiBJIHdvdWxkIGxpa2UgdG8gc2VlayB5b3VyIGd1aWRhbmNlIG9uIGhvdyB0byB0
YWtlIHRoaXMgcGF0Y2ggc2VyaWVzIGZvcndhcmQuCj4gVGhhbmtzIHRvIHlvdXIgZmVlZGJhY2sg
YW5kIFNlcmdlJ3Mgc3VnZ2VzdGlvbnMsIHdlIG1hZGUgc29tZSBmb3J3YXJkCj4gcHJvZ3Jlc3Mg
b24gdGhpcyBwYXRjaCBzZXJpZXMuCj4gUGxlYXNlIG1ha2UgYW55IHN1Z2dlc3Rpb25zIHRvIGVu
YWJsZSB1cyB0byB1cHN0cmVhbSBkcml2ZXIgc3VwcG9ydAo+IGZvciBCQ004OTU4eC4KCkppdGVu
ZHJhLAoJIEhhdmUgd2UgcmVzZW50IHRoaXMgcGF0Y2ggb3IgZ290IGl0IGFwcHJvdmVkID8gSSBk
b250IHNlZSBhbnkgdXBkYXRlcyBhZnRlciB0aGlzIHBhdGNoLiAKCj4gVGhhbmtzLAo+IEppdGVu
ZHJhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
