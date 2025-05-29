Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F87AC779F
	for <lists+linux-stm32@lfdr.de>; Thu, 29 May 2025 07:25:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78343C349C1;
	Thu, 29 May 2025 05:25:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35548C349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 05:25:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T1v4g6027799;
 Thu, 29 May 2025 05:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0bclMJflGoDpC6u6S0sgwywANy1Dvb6NmfRTSgcnga8=; b=gfuFudMPZX8QmICH
 lK/MDFO/urA3YUB7PUkY9heR7oKbGEVLtf/b4GZ/NbXAIR7ZHy5ppV/RahbmZdFj
 rCke3UDlY78wOEyOkxWI3AtXI70LKoZPWPwqnjAeYm/gfXFU+Z0NblKGhOyKs45z
 3ACa6+JHjmhD17+sr52YSr7IQBEVWj4+XmizShblWHk3q3aNp1uPFNJA1LerWMf4
 q8XKkwcvzKOF0sFXt/D6jxA+w1Dqz5TbfIJv7U4a4azrXBKyd5KXzVWDpZTK9owa
 Whgi431bc1xvNaAkk6F4srEOTIKl1yO4gYHOrCrQwvYTUsaTYrqILCr3w2qvxZCC
 Z+HbiA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992pn2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 May 2025 05:25:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54T5P2KF001100
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 May 2025 05:25:02 GMT
Received: from [10.110.61.81] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 22:24:59 -0700
Message-ID: <4a2d8151-9dfe-4876-8216-85211bc393bf@quicinc.com>
Date: Wed, 28 May 2025 22:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yanteng Si <si.yanteng@linux.dev>, Jitendra Vegiraju
 <jitendra.vegiraju@broadcom.com>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
 <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
 <CAMdnO-+HwXf7c=igt2j6VHcki3cYanXpFApZDcEe7DibDz810g@mail.gmail.com>
 <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
 <51768fa6-007e-4f30-ac1f-eed01ae1a3c5@linux.dev>
 <CAMdnO-KNfH79PG1=21Dbyaart2JN_e1XcF+tTG93BG5BobX+Gg@mail.gmail.com>
 <eb591c65-0106-45f4-9e57-434dac54e923@linux.dev>
Content-Language: en-US
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <eb591c65-0106-45f4-9e57-434dac54e923@linux.dev>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA1MiBTYWx0ZWRfX9bwkRqe3K7hG
 kT3bBMtM8uLQJVSK417IAU/yZF63z2rQ9MKu6HMC1yx4K1qKM8kM0pesMcTFWNz7JPBOHiLiSoL
 6MuctcgekxCHSeBUTXfkWOkgurqK9WssRnT45uQaqyAWl41mkdp3hsg93TZ//s5OVDusK1x5plv
 APDKLiOkUiB9WmsCUGsvDWHtPf4ZYzDJt4/4qB6I0GToxwOdFR+WAJJ3umMVrGE3UDb+qtuAyF/
 TVSLWVyY/G+8+LXCW9Z0I2IUo0jNdOJa7ardbZKN/75/iUEiwfTPrAD8G/nVWYRGKfGAnUXdoka
 EwOrPWtHoA88mt+u1YJmoGD5/YWwqaR6Q6vf5epjIHh5b0MneOOjIamii5K4BpJcEmY9jHfbcuK
 3fnxSdsHlkvDI6cd60spXD+eDbyTlOlWaPHSy06FPitmU8yZVaTi+8rx22GBtjbI1hL1agtK
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6837efaf cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=Q-fNiiVtAAAA:8 a=COk6AnOGAAAA:8 a=CyOmcBoVXlxtOUliTrsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ta8-0ys4Gq8QeTxmA8W3M6poBTkirC5h
X-Proofpoint-ORIG-GUID: ta8-0ys4Gq8QeTxmA8W3M6poBTkirC5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290052
Cc: Andrew Lunn <andrew@lunn.ch>, Jianheng.Zhang@synopsys.com,
 edumazet@google.com, Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, xiaolei.wang@windriver.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
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

CgpPbiA1LzI4LzIwMjUgMTA6MTQgUE0sIFlhbnRlbmcgU2kgd3JvdGU6Cj4gCj4g5ZyoIDUvMjkv
MjUgMTA6NTYgQU0sIEppdGVuZHJhIFZlZ2lyYWp1IOWGmemBkzoKPj4gSGkgWWFudGVuZywKPj4K
Pj4gT24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgNjozNuKAr1BNIFlhbnRlbmcgU2kgPHNpLnlhbnRl
bmdAbGludXguZGV2PiB3cm90ZToKPj4+IOWcqCA1LzI4LzI1IDg6MDQgQU0sIEFiaGlzaGVrIENo
YXVoYW4gKEFCQykg5YaZ6YGTOgo+Pj4+Cj4+Pj4gT24gMi83LzIwMjUgMzoxOCBQTSwgSml0ZW5k
cmEgVmVnaXJhanUgd3JvdGU6Cj4+Pj4+IEhpIEFiaGlzaGVrLAo+Pj4+Pgo+Pj4+PiBPbiBGcmks
IEZlYiA3LCAyMDI1IGF0IDEwOjIx4oCvQU0gQWJoaXNoZWsgQ2hhdWhhbiAoQUJDKSA8Cj4+Pj4+
IHF1aWNfYWJjaGF1aGFAcXVpY2luYy5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IE9u
IDExLzUvMjAyNCA4OjEyIEFNLCBKaXRlbmRyYSBWZWdpcmFqdSB3cm90ZToKPj4+Pj4+PiBIaSBu
ZXRkZXYgdGVhbSwKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIEZyaSwgT2N0IDE4LCAyMDI0IGF0IDE6NTPi
gK9QTSA8aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tPiB3cm90ZToKPj4+Pj4+Pj4gRnJv
bTogSml0ZW5kcmEgVmVnaXJhanUgPGppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbT4KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gVGhpcyBwYXRjaHNldCBhZGRzIGJhc2ljIFBDSSBldGhlcm5ldCBkZXZp
Y2UgZHJpdmVyIHN1cHBvcnQgZm9yIEJyb2FkY29tCj4+Pj4+Pj4+IEJDTTg5NTh4IEF1dG9tb3Rp
dmUgRXRoZXJuZXQgc3dpdGNoIFNvQyBkZXZpY2VzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+IEkgd291bGQg
bGlrZSB0byBzZWVrIHlvdXIgZ3VpZGFuY2Ugb24gaG93IHRvIHRha2UgdGhpcyBwYXRjaCBzZXJp
ZXMKPj4+Pj4+IGZvcndhcmQuCj4+Pj4+Pj4gVGhhbmtzIHRvIHlvdXIgZmVlZGJhY2sgYW5kIFNl
cmdlJ3Mgc3VnZ2VzdGlvbnMsIHdlIG1hZGUgc29tZSBmb3J3YXJkCj4+Pj4+Pj4gcHJvZ3Jlc3Mg
b24gdGhpcyBwYXRjaCBzZXJpZXMuCj4+Pj4+Pj4gUGxlYXNlIG1ha2UgYW55IHN1Z2dlc3Rpb25z
IHRvIGVuYWJsZSB1cyB0byB1cHN0cmVhbSBkcml2ZXIgc3VwcG9ydAo+Pj4+Pj4+IGZvciBCQ004
OTU4eC4KPj4+Pj4+IEppdGVuZHJhLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgSGF2ZSB3
ZSByZXNlbnQgdGhpcyBwYXRjaCBvciBnb3QgaXQgYXBwcm92ZWQgPyBJIGRvbnQgc2VlIGFueQo+
Pj4+Pj4gdXBkYXRlcyBhZnRlciB0aGlzIHBhdGNoLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+IFRoYW5r
IHlvdSBmb3IgaW5xdWlyaW5nIGFib3V0IHRoZSBzdGF0dXMgb2YgdGhpcyBwYXRjaC4KPj4+Pj4g
QXMgc3RtbWFjIGRyaXZlciBpcyBnb2luZyB0aHJvdWdoIGEgbWFpbnRhaW5lciB0cmFuc2l0aW9u
LCB3ZSB3YW50ZWQgdG8KPj4+Pj4gd2FpdCB1bnRpbCBhIG5ldyBtYWludGFpbmVyIGlzIGlkZW50
aWZpZWQuCj4+Pj4+IFdlIHdvdWxkIGxpa2UgdG8gc2VuZCB0aGUgdXBkYXRlZCBwYXRjaCBhcyBz
b29uIGFzIHBvc3NpYmxlLgo+Pj4+PiBUaGFua3MsCj4+Pj4+IEppdGVuZHJhCj4+Pj4gVGhhbmtz
IEppdGVuZHJhLCBJIGFtIHNvcnJ5IGJ1dCBqdXN0IGEgZm9sbG93IHVwLgo+Pj4+Cj4+Pj4gRG8g
d2Uga25vdyBpZiBzdG1tYWMgbWFpbnRhaW5lciBhcmUgaWRlbnRpZmllZCBub3cgPwo+Pj4gSSdt
IGN1cmlvdXMgd2h5IHN1Y2ggYSBwcmVjb25kaXRpb24gaXMgYWRkZWTvvJ8KPj4+Cj4+IEl0J3Mg
bm90IGEgcHJlY29uZGl0aW9uLiBMZXQgbWUgZ2l2ZSBzb21lIGNvbnRleHQuCj4+IFRoaXMgcGF0
Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgYSBuZXcgSHlwZXIgRE1BKEhETUEpIE1BQyBmcm9t
IFN5bm9wc2lzLgo+PiBNYW55IG9mIHRoZSBuZXRkZXYgY29tbXVuaXR5IG1lbWJlcnMgcmV2aWV3
ZWQgdGhlIHBhdGNoZXMgYXQgdGhhdCB0aW1lLgo+PiBCZWluZyB0aGUgbW9kdWxlIG1haW50YWlu
ZXIgYXQgdGhhdCB0aW1lLCBTZXJnZSB0b29rIHRoZSBpbml0aWF0aXZlIHRvCj4+IGd1aWRlIHVz
IHRocm91Z2ggaW50ZWdyYXRpbmcgdGhlIG5ldyBNQUMgaW50byB0aGUgc3RtbWFjIGRyaXZlci4K
Pj4gV2UgYWRkcmVzc2VkIGFsbCB0aGUgcmV2aWV3IGNvbW1lbnRzIGFuZCBzdWJtaXR0ZWQgdGhl
IGxhc3QgcGF0Y2ggc2VyaWVzLgo+PiBXaXRob3V0IGFuIG9mZmljaWFsIG1haW50YWluZXIsIHdl
IGRpZG4ndCBnZXQgZmVlZGJhY2sgb24gdGhlIGxhc3QgcGF0Y2ggc2VyaWVzLgo+PiBCZWNhdXNl
IG9mIHRoaXMsIHdlIHdhbnRlZCB0byB3YWl0IHVudGlsIGEgbmV3IG1haW50YWluZXIgaXMgYXNz
aWduZWQKPj4gdG8gdGhpcyBtb2R1bGUuCj4+IEFzIEFiaGlzaGVrIGV4cHJlc3NlZCBpbiBoaXMg
ZW1haWwsIGl0IGFwcGVhcnMgdGhlIEhETUEgTUFDIGlzCj4+IGJlY29taW5nIG1vcmUgbWFpbnN0
cmVhbS4KPj4gV2UgYXJlIGhvcGluZyB0byByZWJhc2UgdGhlIHBhdGNoIHNlcmllcyBhbmQgcmVz
dWJtaXQgZm9yIHJldmlldyBpZgo+PiBuZXRkZXYgdGVhbSBtZW1iZXJzIHNob3cgaW50ZXJlc3Qu
Cj4gCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQxMDE4MjA1MzMyLjUy
NTU5NS0xLWppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbS8KPiAKPiBJbiBteSBvcGluaW9u
LCB0aGUgcHJlY29uZGl0aW9uIGZvciB3YWl0aW5nIGZvciBhIG1haW50YWluZXIgaXMgdGhhdAo+
IAo+IHRoZSBwYXRjaCBzZXQgaGFzIHBhc3NlZCB0aGUgcmV2aWV3LiBJIGNoZWNrZWQgbG9yZSBh
bmQgZGlkIG5vdCBmaW5kCj4gCj4gYW55IFImQiB0YWdzIGluIHRoZSBwYXRjaCBzZXQsIHdoaWNo
IG1lYW5zIHlvdXIgcGF0Y2ggc2V0IGhhcyBub3QKPiAKPiB5ZXQgbWV0IHRoZSBtZXJnaW5nIHJl
cXVpcmVtZW50cy4KPiAKPiBUaGVyZWZvcmUsIEkgdGhpbmsgeW91IGNhbiBjb250aW51ZSB0byBw
dXNoIGZvcndhcmQgd2l0aCB0aGlzIHBhdGNoCj4gCj4gc2V0IGFuZCBub3QgbGV0IGl0IHN0YWdu
YXRlLiBJIHdpbGwgdGFrZSBzb21lIHRpbWUgdG8gcmV2aWV3IHRoZSBwcmV2aW91cwo+IAo+IHZl
cnNpb25zICh3aGljaCBtYXkgdGFrZSBhIHdoaWxlKSBhbmQgaG9wZSB0byBiZSBoZWxwZnVsLgo+
IAo+IFRoYW5rcywKPiAKPiBZYW50ZW5nCj4gCkkgd2lsbCByZXZpZXcgdGhlIHBhdGNoIGluIHRo
ZSBjb21pbmcgZmV3IGRheXMgYXMgd2VsbC4gQXMgdGhpcyBwYXRjaCBhbHNvIGhlbHBzIFF1YWxj
b21tIHRvIGRldmVsb3AgdGhlIApIRE1BIGFyY2ggZm9yIDI1WEdNQUMgRU1BQyBjb250cm9sbGVy
LiAKVGhpcyBwYXRjaCBpcyB2YWxpZGF0ZWQvdmVyZmllZC90ZXN0ZWQgb24gUXVhbGNvbW0gcGxh
dGZvcm0gZGV2aWNlcyB3aGljaCBhcmUgbm90IFBDSUUgYmFzZWQuIAo+PiBUaGFua3MsCj4+IEpp
dGVuZHJhCj4+PiBUaGFua3MsCj4+PiBZYW50ZW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
