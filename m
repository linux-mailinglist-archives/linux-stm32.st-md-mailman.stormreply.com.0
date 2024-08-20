Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDDA959102
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 01:18:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D971CC6DD9A;
	Tue, 20 Aug 2024 23:18:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B089EC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 23:18:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KJDEfS010532;
 Tue, 20 Aug 2024 23:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NprW64KSKzwOFF6jo1JC3Lh788yHamO3HdbBMZJQ/MI=; b=eeVY0+BW5Y003jD1
 wWZSdsM7V5k9PGOpndK7aMp2cq1IULmj4qA25ufm/M9+ubY5c3gSFwvjgd1ifgVU
 /qr4ZsdysYOCm3MedjKKDXVkdxhTmeK3tGKoyc1hg0aoTNEi07Q2VaYNFArRrezj
 Ubbgx9zUyGcpaYNfAOvdBrynBV/AP9lvxEFrYRoUXkQ9XdV59VJxyuRAMTJu/Em9
 5JIcyEcFZzVzjtlultQ05s23D3lE2MwigFLeHKSmRBILaqktepa8FHZqqLsdWC2Q
 2jm4WQIxZqBo/DQksue0niBfVQFxE4YEIV4Ttvx5H5ehXAWsnXSpd4pzLK38Foa0
 ob6v3w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 413qxg6vef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2024 23:12:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KNCref023267
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2024 23:12:53 GMT
Received: from [10.110.47.196] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 16:12:52 -0700
Message-ID: <cab82577-9979-464f-84a2-02962b1641fc@quicinc.com>
Date: Tue, 20 Aug 2024 16:12:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
 <20240814221818.2612484-2-jitendra.vegiraju@broadcom.com>
 <2ad03012-8a10-49fc-9e80-3b91762b9cc3@quicinc.com>
 <CAMdnO-LH0xNeMO_Y+WhSmbyNrK33zb=AtVd9ZRTObQ-n8BWR6w@mail.gmail.com>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <CAMdnO-LH0xNeMO_Y+WhSmbyNrK33zb=AtVd9ZRTObQ-n8BWR6w@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZR126PUREwqS3M4XNHxBzJ3D4QSZwj2G
X-Proofpoint-GUID: ZR126PUREwqS3M4XNHxBzJ3D4QSZwj2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408200170
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 1/5] net: stmmac: Add HDMA mapping
 for dw25gmac support
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

CgpPbiA4LzIwLzIwMjQgNDoxMCBQTSwgSml0ZW5kcmEgVmVnaXJhanUgd3JvdGU6Cj4gT24gVGh1
LCBBdWcgMTUsIDIwMjQgYXQgNDozMOKAr1BNIEFiaGlzaGVrIENoYXVoYW4gKEFCQykKPiA8cXVp
Y19hYmNoYXVoYUBxdWljaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IE9uIDgvMTQvMjAyNCAz
OjE4IFBNLCBqaXRlbmRyYS52ZWdpcmFqdUBicm9hZGNvbS5jb20gd3JvdGU6Cj4+PiBGcm9tOiBK
aXRlbmRyYSBWZWdpcmFqdSA8aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tPgo+Pj4KPj4+
IEFkZCBoZG1hIGNvbmZpZ3VyYXRpb24gc3VwcG9ydCBpbiBpbmNsdWRlL2xpbnV4L3N0bW1hYy5o
IGZpbGUuCj4+PiBUaGUgaGRtYSBjb25maWd1cmF0aW9uIGluY2x1ZGVzIG1hcHBpbmcgb2Ygdmly
dHVhbCBETUFzIHRvIHBoeXNpY2FsIERNQXMuCj4+PiBEZWZpbmUgYSBuZXcgZGF0YSBzdHJ1Y3R1
cmUgc3RtbWFjX2hkbWFfY2ZnIHRvIHByb3ZpZGUgdGhlIG1hcHBpbmcuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogSml0ZW5kcmEgVmVnaXJhanUgPGppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNv
bT4KPj4+IC0tLQo+Pj4gIGluY2x1ZGUvbGludXgvc3RtbWFjLmggfCA1MCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5z
ZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oIGIv
aW5jbHVkZS9saW51eC9zdG1tYWMuaAo+Pj4gaW5kZXggMzM4OTkxYzA4ZjAwLi4xNzc1YmQyYjdj
MTQgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oCj4+PiArKysgYi9pbmNs
dWRlL2xpbnV4L3N0bW1hYy5oCj4+PiBAQCAtODksNiArODksNTUgQEAgc3RydWN0IHN0bW1hY19t
ZGlvX2J1c19kYXRhIHsKPj4+ICAgICAgIGJvb2wgbmVlZHNfcmVzZXQ7Cj4+PiAgfTsKPj4+Cj4+
PiArLyogRFcyNUdNQUMgSHlwZXItRE1BIE92ZXJ2aWV3Cj4+PiArICogSHlwZXItRE1BIGFsbG93
cyBzdXBwb3J0IGZvciBsYXJnZSBudW1iZXIgb2YgVmlydHVhbCBETUEoVkRNQSkKPj4+ICsgKiBj
aGFubmVscyB1c2luZyBhIHNtYWxsZXIgc2V0IG9mIHBoeXNpY2FsIERNQSBjaGFubmVscyhQRE1B
KS4KPj4+ICsgKiBUaGlzIGlzIHN1cHBvcnRlZCBieSB0aGUgIG1hcHBpbmcgb2YgVkRNQXMgdG8g
VHJhZmZpYyBDbGFzcyAoVEMpCj4+PiArICogYW5kIFBETUEgdG8gVEMgaW4gZWFjaCB0cmFmZmlj
IGRpcmVjdGlvbiBhcyBzaG93biBiZWxvdy4KPj4+ICsgKgo+Pj4gKyAqICAgICAgICBWRE1BcyAg
ICAgICAgICAgIFRyYWZmaWMgQ2xhc3MgICAgICBQRE1BCj4+PiArICogICAgICAgKy0tLS0tLS0t
KyAgICAgICAgICArLS0tLS0tKyAgICAgICAgICstLS0tLS0tLS0tLSsKPj4+ICsgKiAgICAgICB8
VkRNQTAgICB8LS0tLS0tLS0tPnwgVEMwICB8LS0tLS0tLS0+fFBETUEwL1RYUTAgfAo+Pj4gKyAq
VFggICAgICstLS0tLS0tLSsgICB8LS0tLS0+Ky0tLS0tLSsgICAgICAgICArLS0tLS0tLS0tLS0r
Cj4+PiArICpIb3N0PT4gKy0tLS0tLS0tKyAgIHwgICAgICArLS0tLS0tKyAgICAgICAgICstLS0t
LS0tLS0tLSsgPT4gTUFDCj4+PiArICpTVyAgICAgfFZETUExICAgfC0tLSsgICAgICB8IFRDMSAg
fCAgICArLS0tPnxQRE1BMS9UWFExIHwKPj4+ICsgKiAgICAgICArLS0tLS0tLS0rICAgICAgICAg
ICstLS0tLS0rICAgIHwgICAgKy0tLS0tLS0tLS0tKwo+Pj4gKyAqICAgICAgICstLS0tLS0tLSsg
ICAgICAgICAgKy0tLS0tLSstLS0tKyAgICArLS0tLS0tLS0tLS0rCj4+PiArICogICAgICAgfFZE
TUEyICAgfC0tLS0tLS0tLT58IFRDMiAgfC0tLS0tLS0tPnxQRE1BMi9UWFExIHwKPj4+ICsgKiAg
ICAgICArLS0tLS0tLS0rICAgICAgICAgICstLS0tLS0rICAgICAgICAgKy0tLS0tLS0tLS0tKwo+
Pj4gKyAqICAgICAgICAgICAgLiAgICAgICAgICAgICAgICAgLiAgICAgICAgICAgICAgICAgLgo+
Pj4gKyAqICAgICAgICstLS0tLS0tLSsgICAgICAgICAgKy0tLS0tLSsgICAgICAgICArLS0tLS0t
LS0tLS0rCj4+PiArICogICAgICAgfFZETUFuLTEgfC0tLS0tLS0tLT58IFRDeC0xfC0tLS0tLS0t
PnxQRE1BbS9UWFFtIHwKPj4+ICsgKiAgICAgICArLS0tLS0tLS0rICAgICAgICAgICstLS0tLS0r
ICAgICAgICAgKy0tLS0tLS0tLS0tKwo+Pj4gKyAqCj4+PiArICogICAgICAgKy0tLS0tLSsgICAg
ICAgICAgKy0tLS0tLSsgICAgICAgICArLS0tLS0tKwo+Pj4gKyAqICAgICAgIHxQRE1BMCB8LS0t
LS0tLS0tPnwgVEMwICB8LS0tLS0tLS0+fFZETUEwIHwKPj4+ICsgKiAgICAgICArLS0tLS0tKyAg
IHwtLS0tLT4rLS0tLS0tKyAgICAgICAgICstLS0tLS0rCj4+PiArICpNQUMgPT4gKy0tLS0tLSsg
ICB8ICAgICAgKy0tLS0tLSsgICAgICAgICArLS0tLS0tKwo+Pj4gKyAqUlhRcyAgIHxQRE1BMSB8
LS0tKyAgICAgIHwgVEMxICB8ICAgICstLS0+fFZETUExIHwgID0+IEhvc3QKPj4+ICsgKiAgICAg
ICArLS0tLS0tKyAgICAgICAgICArLS0tLS0tKyAgICB8ICAgICstLS0tLS0rCj4+PiArICogICAg
ICAgICAgICAuICAgICAgICAgICAgICAgICAuICAgICAgICAgICAgICAgICAuCj4+PiArICovCj4+
PiArCj4+PiArI2RlZmluZSBTVE1NQUNfRFcyNUdNQUNfTUFYX05VTV9UWF9WRE1BICAgICAgICAg
ICAgICAxMjgKPj4+ICsjZGVmaW5lIFNUTU1BQ19EVzI1R01BQ19NQVhfTlVNX1JYX1ZETUEgICAg
ICAgICAgICAgIDEyOAo+Pj4gKwo+Pj4gKyNkZWZpbmUgU1RNTUFDX0RXMjVHTUFDX01BWF9OVU1f
VFhfUERNQSAgICAgICAgICAgICAgOAo+Pj4gKyNkZWZpbmUgU1RNTUFDX0RXMjVHTUFDX01BWF9O
VU1fUlhfUERNQSAgICAgICAgICAgICAgMTAKPj4+ICsKPj4gSSBoYXZlIGEgcXVlcnkgaGVyZS4K
Pj4KPj4gV2h5IGRvIHdlIG5lZWQgdG8gaGFyZGNvZGUgdGhlIG51bWJlciBvZiBUWCBQRE1BIGFu
ZCBSWCBQRE1BIHRvIDggYW4gMTAuIE9uIHNvbWUgcGxhdGZvcm1zIHRoZSBudW1iZXIgb2Ygc3Vw
cG9ydGVkIFRYUERNQSBhbmQgUlhQRE1BIGFyZSAxMSBhbmQgMTEgcmVzcGVjdGl2ZWx5ID8KPj4K
Pj4gaG93IGRvIHdlIG92ZXJjb21lIHRoaXMgcHJvYmxlbSwgZG8gd2UgaW5jcmVhc2UgdGhlIHZh
bHVlIGluIHN1Y2ggY2FzZT8KPj4KPiBIaSBBYmhpc2hlaywKPiBBZ3JlZWQsIHdlIGNhbiBtYWtl
IHRoZSBtYXBwaW5nIHRhYmxlcyBtb3JlIGdlbmVyaWMuCj4gV2Ugd2lsbCByZXBsYWNlIHN0YXRp
YyBhcnJheXMgd2l0aCBkeW5hbWljYWxseSBhbGxvY2F0ZWQgbWVtb3J5IGJ5Cj4gcmVhZGluZyB0
aGUgVFhQRE1BIGFuZCBSWFBETUEgY291bnRzIGZyb20gaGFyZHdhcmUuCj4gVGhhbmtzCgpUaGF0
J3MgYSBncmVhdCBpZGVhLiBUaGFua3MgSml0ZW5kcmEuIFRoaXMgd2F5IHdlIGRvIG5vdCBoYXZl
IHRvIGhhcmQgY29kZSBhbnl0aGluZy4gCgo+Pj4gKyNkZWZpbmUgU1RNTUFDX0RXMjVHTUFDX01B
WF9UQyAgICAgICAgICAgICAgICAgICAgICAgOAo+Pj4gKwo+Pj4gKy8qIEh5cGVyLURNQSBtYXBw
aW5nIGNvbmZpZ3VyYXRpb24KPj4+ICsgKiBUcmFmZmljIENsYXNzIGFzc29jaWF0ZWQgd2l0aCBl
YWNoIFZETUEvUERNQSBtYXBwaW5nCj4+PiArICogaXMgc3RvcmVkIGluIGNvcnJlc3BvbmRpbmcg
YXJyYXkgZW50cnkuCj4+PiArICovCj4+PiArc3RydWN0IHN0bW1hY19oZG1hX2NmZyB7Cj4+PiAr
ICAgICB1OCB0dmRtYV90Y1tTVE1NQUNfRFcyNUdNQUNfTUFYX05VTV9UWF9WRE1BXTsKPj4+ICsg
ICAgIHU4IHJ2ZG1hX3RjW1NUTU1BQ19EVzI1R01BQ19NQVhfTlVNX1JYX1ZETUFdOwo+Pj4gKyAg
ICAgdTggdHBkbWFfdGNbU1RNTUFDX0RXMjVHTUFDX01BWF9OVU1fVFhfUERNQV07Cj4+PiArICAg
ICB1OCBycGRtYV90Y1tTVE1NQUNfRFcyNUdNQUNfTUFYX05VTV9SWF9QRE1BXTsKPj4+ICt9Owo+
Pj4gKwo+Pj4gIHN0cnVjdCBzdG1tYWNfZG1hX2NmZyB7Cj4+PiAgICAgICBpbnQgcGJsOwo+Pj4g
ICAgICAgaW50IHR4cGJsOwo+Pj4gQEAgLTEwMSw2ICsxNTAsNyBAQCBzdHJ1Y3Qgc3RtbWFjX2Rt
YV9jZmcgewo+Pj4gICAgICAgYm9vbCBtdWx0aV9tc2lfZW47Cj4+PiAgICAgICBib29sIGRjaGU7
Cj4+PiAgICAgICBib29sIGF0ZHM7Cj4+PiArICAgICBzdHJ1Y3Qgc3RtbWFjX2hkbWFfY2ZnICpo
ZG1hX2NmZzsKPj4+ICB9Owo+Pj4KPj4+ICAjZGVmaW5lIEFYSV9CTEVOICAgICA3Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
