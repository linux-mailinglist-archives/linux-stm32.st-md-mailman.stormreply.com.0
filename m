Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE8AC5DFD
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 02:05:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C426C36B1E;
	Wed, 28 May 2025 00:05:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7689FC36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 00:05:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHTw0m029872;
 Wed, 28 May 2025 00:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aDUNQStuy0jRMfLgtZNwbSDgWxeyT3CWPdpJ9IflsOA=; b=KPa9xkJnirrwzekO
 bDz3gfL44EL6qyKyMqf8l+ZazG8GyQ+Pp+Q2VEW9BJK+Hrk++Vnco1Ch3P2Hr6aj
 y2+1FGK/8JQE4sOUa6aIl6dR9BS14FycJvUHzIdKiuiEu/YMnJ/6gVoj8dyIxNud
 PYmG99yMkuEOC4P5YhenxRTbg9f+g/1xMcxnKgdP8pqwpyWCROVfg3cvS6lmNWyu
 aRsgre5v8zia5HJlWjSrPuBgQ+32tmg2ZTiKhniIdKp8mCAKdezQVe3lPMEVo29/
 YcsC2kt0lYQFYlgVT5A5/oBiI8U8KSWMIuuAXsXOdYdlOY0+/PgK+rdGNxne2Ulg
 yPZZuA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf0v68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 00:04:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54S04wpi029950
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 00:04:58 GMT
Received: from [10.46.19.239] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 May
 2025 17:04:58 -0700
Message-ID: <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
Date: Tue, 27 May 2025 17:04:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>, Andrew Lunn
 <andrew@lunn.ch>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
 <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
 <CAMdnO-+HwXf7c=igt2j6VHcki3cYanXpFApZDcEe7DibDz810g@mail.gmail.com>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <CAMdnO-+HwXf7c=igt2j6VHcki3cYanXpFApZDcEe7DibDz810g@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6836532b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Q-fNiiVtAAAA:8 a=GcoI09lhNaN5Dz-92OEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zpgw-8AFVHvXHtIYfQ8he9X3VaAn-d9R
X-Proofpoint-GUID: zpgw-8AFVHvXHtIYfQ8he9X3VaAn-d9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDIwNSBTYWx0ZWRfX8H1fR9ASfCTa
 ZlnZzyxxTeEKKwpoBS+icLkuaoKXs4Azv6NRGJGyRSh+Ov1Dgd8gUpITWQcc8f917X6MsQWXJq8
 DNiWojEgXqeKeMQ4jEMgKanGjYrxyECFJlj77JL2zanB+lj6nZJBW95l4BphnN2vvIlMiVmgwiG
 AqJX7RuCgI6rc+kZzA731mkW4JFsWNk7eazg4sZGM9zNctL3mnh3Es4qQD9rOEXN+PfGop+t8YK
 4PQvT7toq/X8Cuj+P45Z4i+lAXRLvdR/ZQJvDfl3uAXazTazV/Z/vG6s6ytO7h6LH0anFkC4EMp
 0bzre8YvTRSTEe/CQ5IcStqOjxZeBE6zyiQnvZzPxlrc58QS/arf2cuUmTGcfBvpuN5lQDEPlRC
 FRBsxV9WT+kO5VYpNEo/kls+YIB6bYXc3PQOoGZWTk6jxeRYgVk8T+OpApL1UpiHg9e822RW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270205
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
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

CgpPbiAyLzcvMjAyNSAzOjE4IFBNLCBKaXRlbmRyYSBWZWdpcmFqdSB3cm90ZToKPiBIaSBBYmhp
c2hlaywKPiAKPiBPbiBGcmksIEZlYiA3LCAyMDI1IGF0IDEwOjIx4oCvQU0gQWJoaXNoZWsgQ2hh
dWhhbiAoQUJDKSA8Cj4gcXVpY19hYmNoYXVoYUBxdWljaW5jLmNvbT4gd3JvdGU6Cj4gCj4+Cj4+
Cj4+IE9uIDExLzUvMjAyNCA4OjEyIEFNLCBKaXRlbmRyYSBWZWdpcmFqdSB3cm90ZToKPj4+IEhp
IG5ldGRldiB0ZWFtLAo+Pj4KPj4+IE9uIEZyaSwgT2N0IDE4LCAyMDI0IGF0IDE6NTPigK9QTSA8
aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEZyb206IEpp
dGVuZHJhIFZlZ2lyYWp1IDxqaXRlbmRyYS52ZWdpcmFqdUBicm9hZGNvbS5jb20+Cj4+Pj4KPj4+
PiBUaGlzIHBhdGNoc2V0IGFkZHMgYmFzaWMgUENJIGV0aGVybmV0IGRldmljZSBkcml2ZXIgc3Vw
cG9ydCBmb3IgQnJvYWRjb20KPj4+PiBCQ004OTU4eCBBdXRvbW90aXZlIEV0aGVybmV0IHN3aXRj
aCBTb0MgZGV2aWNlcy4KPj4+Pgo+Pj4KPj4+IEkgd291bGQgbGlrZSB0byBzZWVrIHlvdXIgZ3Vp
ZGFuY2Ugb24gaG93IHRvIHRha2UgdGhpcyBwYXRjaCBzZXJpZXMKPj4gZm9yd2FyZC4KPj4+IFRo
YW5rcyB0byB5b3VyIGZlZWRiYWNrIGFuZCBTZXJnZSdzIHN1Z2dlc3Rpb25zLCB3ZSBtYWRlIHNv
bWUgZm9yd2FyZAo+Pj4gcHJvZ3Jlc3Mgb24gdGhpcyBwYXRjaCBzZXJpZXMuCj4+PiBQbGVhc2Ug
bWFrZSBhbnkgc3VnZ2VzdGlvbnMgdG8gZW5hYmxlIHVzIHRvIHVwc3RyZWFtIGRyaXZlciBzdXBw
b3J0Cj4+PiBmb3IgQkNNODk1OHguCj4+Cj4+IEppdGVuZHJhLAo+PiAgICAgICAgICBIYXZlIHdl
IHJlc2VudCB0aGlzIHBhdGNoIG9yIGdvdCBpdCBhcHByb3ZlZCA/IEkgZG9udCBzZWUgYW55Cj4+
IHVwZGF0ZXMgYWZ0ZXIgdGhpcyBwYXRjaC4KPj4KPj4KPiBUaGFuayB5b3UgZm9yIGlucXVpcmlu
ZyBhYm91dCB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2guCj4gQXMgc3RtbWFjIGRyaXZlciBpcyBn
b2luZyB0aHJvdWdoIGEgbWFpbnRhaW5lciB0cmFuc2l0aW9uLCB3ZSB3YW50ZWQgdG8KPiB3YWl0
IHVudGlsIGEgbmV3IG1haW50YWluZXIgaXMgaWRlbnRpZmllZC4KPiBXZSB3b3VsZCBsaWtlIHRv
IHNlbmQgdGhlIHVwZGF0ZWQgcGF0Y2ggYXMgc29vbiBhcyBwb3NzaWJsZS4KPiBUaGFua3MsCj4g
Sml0ZW5kcmEKVGhhbmtzIEppdGVuZHJhLCBJIGFtIHNvcnJ5IGJ1dCBqdXN0IGEgZm9sbG93IHVw
LiAKCkRvIHdlIGtub3cgaWYgc3RtbWFjIG1haW50YWluZXIgYXJlIGlkZW50aWZpZWQgbm93ID8K
CkFuZHJldy9SdXNzZWxsIC0gQ2FuIHlvdSBwbGVhc2UgaGVscCB1cyA/IAoKQmVzdCByZWdhcmRz
CkFCQwoKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
