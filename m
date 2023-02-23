Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C96A02E2
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 07:42:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8B3EC6A5F8;
	Thu, 23 Feb 2023 06:42:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE054C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 06:42:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31N6MaxW014186; Thu, 23 Feb 2023 06:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ju5cCx2oxLwShnwD+p6BKM8msTmZUzHRH1vpfUwQDTI=;
 b=LDQL1EV7/qF4LCJkjbrvTt8yC+/wWt8uZa5u5uhATvCvFmkL0rXDlHN6qmhOHgXLe5nS
 GQ4zzZV8ueQqiCu3x3UJxY9tdHepxsJZ0mRxmLsfUIycmFspXHvu3nYSVg0tSYi+Ijw0
 Ci67gnuJaqydnuIJKeaPDBVLHbQ+Ep+oJVCZVSgzHQY/jsLbQPxZCBwT8BT+DzS2Zgjp
 tfhso1ItH4A1iBFM+nCjxcFKmkltf87N2ciUx0VrwsgZMSqG7h350t2bN7iBr0T+HQK+
 mHDvG3XG+ZzXOn8xLSBZABDVvtz+nurzEEeslnIb/4ya01swsKx2daMg0AOvIS621Sxn FQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwy8m0gbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 06:41:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31N6fd5E019565
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 06:41:39 GMT
Received: from [10.239.133.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Feb
 2023 22:41:20 -0800
Message-ID: <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
Date: Thu, 23 Feb 2023 14:41:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Mike Leach <mike.leach@linaro.org>, Suzuki K Poulose
 <suzuki.poulose@arm.com>
References: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
 <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
 <CAJ9a7Vjyc-T+LjHtBBYO2MS15z1sVUYxQro_5YpZ9oGMiB0GZA@mail.gmail.com>
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <CAJ9a7Vjyc-T+LjHtBBYO2MS15z1sVUYxQro_5YpZ9oGMiB0GZA@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qH8VTUjXIFN9wPBrQ-T_99CiNMgPoU26
X-Proofpoint-ORIG-GUID: qH8VTUjXIFN9wPBrQ-T_99CiNMgPoU26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_03,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 mlxlogscore=988 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230056
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Coresight ML <coresight@lists.linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>
Subject: Re: [Linux-stm32] [RFC] Add trig_ts function in STM to generate
 TRIG_TS packet periodically
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

Ck9uIDIvMjIvMjAyMyA4OjE5IFBNLCBNaWtlIExlYWNoIHdyb3RlOgo+IEhpCj4KPiBBIGNvdXBs
ZSBhZGRpdGlvbmFsIHBvaW50cy4uLgo+Cj4gT24gV2VkLCAyMiBGZWIgMjAyMyBhdCAxMTowMCwg
U3V6dWtpIEsgUG91bG9zZSA8c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDIx
LzAyLzIwMjMgMDY6NTMsIEppbmxvbmcgTWFvIHdyb3RlOgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IFdo
ZW4gdGhlcmUgaXMgc29tZSBzbWFsbCBwYWNrZXQgc2VudCBmcm9tIFNUTSB0byBFVFIsIHRoZSBz
bWFsbCBwYWNrZXQKPj4+IGNvdWxkIGJlIHN0dWNrIGJldHdlZW4gc291cmNlCj4+PiBhbmQgc2lu
ayBldmVuIGlmIG1hbnVhbCBmbHVzaCBpcyBzZXQgd2hlbiBkaXNhYmxlIEVUUi4KPj4gV2h5ID8g
VGhlIG1hbnVhbCBmbHVzaCBzaG91bGQgdHJpZ2dlciBhIGZsdXNoIHJlcXVlc3QgdXBzdHJlYW0K
Pj4gYW5kIGV2ZW50dWFsbHkgY2F1c2UgYSBmbHVzaCA/IElmIHRoaXMgZG9lc24ndCB3b3JrIGFz
IGV4cGVjdGVkCj4+IHdlIHNob3VsZCB0cnkgdG8gZ2V0IHRvIHRoZSBib3R0b20gb2YgdGhhdCBm
aXJzdCwgYmVmb3JlIGp1bXBpbmcKPj4gaW50byAic29mdHdhcmUgd29yayBhcm91bmRzIi4KPj4K
Pj4+IFNvIHRoZXJlIGlzIHJlcXVpcmVtZW50IHRoYXQgZmx1c2ggdGhlIFNUTSB0cmFjZSBwZXJp
b2RpY2FsbHkgYWZ0ZXIKPj4+IGVuYWJsaW5nIFNUTSB0byBFVFIuCj4+Pgo+Pj4gU1RNIGNhbiBn
ZW5lcmF0ZSBUUklHX1RTIHBhY2tldCBieSB3cml0aW5nIHRvIG9mZnNldCAweEYwIG9mIHRoZSBk
cml2ZXIKPj4+IFNUTSBzdGltdWx1cyBwb3J0Lgo+Pj4gRVRSIGhhcyBhYmlsaXR5IHRvIGluaXRp
YXRlIGEgZmx1c2ggb24gc2VlaW5nIGEgVFJJR19UUyBwYWNrZXQuCj4+IFdoeSBpcyB0aGlzIGRp
ZmZlcmVudCBmcm9tIHRoZSAibWFudWFsIGZsdXNoIiBhbmQgaG93IGRvZXMgaXQgaGVscCA/Cj4+
IElzIGl0IGJlY2F1c2Ugb25lIG9mIHRoZSBjb21wb25lbnRzIGRvZXNuJ3QgcmVzcG9uZCBwcm9w
ZXJseSB0byB0aGUKPj4gZmx1c2ggcmVxdWVzdCA/Cj4+Cj4+Cj4+IEtpbmQgcmVnYXJkcwo+PiBT
dXp1a2kKPj4KPj4+IEZvciB0aGlzIHJlcXVpcmVtZW50LCBJIHdhbnQgdG8gY3JlYXRlIGEgc3lz
ZnMgbm9kZSBsaWtlIHRyaWdfdHMgZm9yIFNUTS4KPj4+IFdoZW4gd3JpdGluZyAxIHRvIHRoaXMg
c3lzZnMgbm9kZSwgYSB0aW1lciB3aXRoIDEgc2Vjb25kIHBlcmlvZGljaXR5IGluCj4+PiBTVE0g
d2lsbCBzdGFydCB0byBnZW5lcmF0ZSB0aGUgdHJpZ190cyBwYWNrZXQgdG8gRVRSLgo+IElmIHRo
aXMgaXMgcmVhbGx5IG5lZWRlZCwgdGhlbiB0aGUgc291cmNlIHdyaXRpbmcgdGhlIGRhdGEgeW91
IHdpc2ggdG8KPiBmbHVzaCBzaG91bGQgd3JpdGUgdG8gdGhlIHJlbGV2YW50IFNUTSBzdGltdWx1
cyBwb3J0LiBUaGVyZSBpcyBubwo+IGp1c3RpZmljYXRpb24gZm9yIGEgcG9sbGluZyBtZWNoYW5p
c20gd2hlbiB0aGUgY2xpZW50IGl0c2VsZiBjYW4gZG8KPiB0aGUgd3JpdGUgYXQgYSAgdGltZSB5
b3UgYmVsaWV2ZSBpdCB0byBiZSBuZWVkZWQuCj4KPj4+IE9uY2UgRVRSIHJlY2VpdmUgdGhlIFRS
SUdfVFMgcGFja2V0LCBpdCB3aWxsIGluaXRpYXRlIGEgZmx1c2guCj4gVGhlIEVUUiBkb2VzIG5v
dCBpbnRlcnByZXQgU1RNIHBhY2tldHMgLSB0aGlzIGFsb25lIHdpbGwgbm90IGluaXRpYXRlIGEg
Zmx1c2guCj4KPiBJdCBpcyBwb3NzaWJsZSB0byBwcm9ncmFtIHRoZSBFVFIgdG8gcmVzcG9uZCB0
byB0aGUgRkxVU0hJTiBvciBUUklHSU4KPiBzaWduYWxzIHZpYSB0aGUgRUNUL0NUSSBuZXR3b3Jr
IG9mIHNpZ25hbHMsIG9yIGEgdHJpZ2dlciBldmVudCBpbiB0aGUKPiB0cmFjZSBzdHJlYW0gKEFU
SUQ9MHg3RCkgaWYgYSBzb3VyY2UgKGluIHRoaXMgY2FzZSB0aGUgU1RNKSBpcwo+IHByb2dyYW1t
ZWQgdG8gb3V0cHV0IHRoZXNlIHNwZWNpZmljIHBhY2tldHMgd2hlbiBpdCBnZW5lcmF0ZXMgdHJp
Z2dlcgo+IHBhY2tldHMgaW4gaXRzIG93biBwcm90b2NvbC4KPiBQcm9ncmFtbWluZyBiaXRzIGlu
IHRoZSBGRkNSIGNvbnRyb2wgdGhlc2Ugb3BlcmF0aW9ucywgU1RNIG11c3QgYmUKPiBwcm9ncmFt
bWVkIHNlcGFyYXRlbHkgdG8gZ2VuZXJhdGUgYXBwcm9wcmlhdGUgb3V0cHV0IHJlc3BvbnNlcyBv
bgo+IHRyaWdnZXIgcGFja2V0cy4KPgo+IFJlZ2FyZHMKPgo+IE1pa2UKCkhpIFN1enVraSAmIE1p
a2UsCgpUaGVyZSBpcyBVU0IgY2FzZSBzdXBwb3J0IGluIG91ciBpbnRlcm5hbCBkZXZpY2UuCkRh
dGEgcGF0aCBpcyB0aGF0wqAgU1RNIGRhdGEgLS0tPiBFVFIgLS0tLS0+IFVTQiAtLS0tPiBQQyB0
b29sLgoKT24gUEMgdG9vbCwgaXQgY2FuIHNob3cgdGhlIGxvZ3MgZnJvbSBFVFIgaW4gcmVhbCB0
aW1lLgoKV2hlbiBvbmUgc21hbGwgcGFja2V0IHNlbmQgZnJvbSBTVE0gdG8gRVRSLCBpdCBjYW4g
YmUgc3R1Y2sgYmV0d2VlbiBTVE0gCmFuZCBFVFIuCldoZW4gdGhlIHBhY2tldCBzdHVjayBoYXBw
ZW5zLCBpdCB3aWxsIGJlIGZsdXNoZWQgdG8gRVRSIG9ubHkgd2hlbiBzb21lIApvdGhlciBwYWNr
ZXRzCmdlbmVyYXRlZCBmcm9tIFNUTSBzb3VyY2Ugb3IgQ1RJIGZsdXNoIGNvbW1hbmRzIGFyZSBz
ZW50LiBJZiB0aGUgdGltZSBpcyAKdG9vIGxvbmcgdG8gd2FpdApmb3IgbmV4dCBwYWNrZXRzIGNv
bWluZywgdXNlciB3aWxsIGNvbnNpZGVyIHRoYXQgaXNzdWUgaGFwcGVucyB3aXRoIApwcmV2aW91
cyBzbWFsbCBwYWNrZXQuCkFuZCB1c2VyJ3MgcmVxdWlyZW1lbnQgaXMgdGhhdCBwYWNrZXQgZnJv
bSBTVE0gY2FuIGJlIGZsdXNoZWQgdG8gRVRSIAphdXRvbWF0aWNhbGx5IGluc3RlYWQKb2Ygc2Vu
ZGluZyBjb21tYW5kcyBtYW51YWxseS4KCklzIGl0IGFwcHJvcHJpYXRlIHRvIGFkZCBhIHN5c2Zz
IG5vZGUgZm9yIFNUTSB0byBnZW5lcmF0ZSB0aGUgdHJpZ2dlciAKcGFja2V0IHBlcmlvZGljYWxs
eSBmb3Igc3VjaCBjYXNlID8KCgpUaGFua3MKSmlubG9uZyBNYW8KCgo+Cj4+PiBDb3VsZCB5b3Ug
cGxlYXNlIGhlbHAgdG8gcHJvdmlkZSB5b3VyIGNvbW1lbnRzIG9uIHRoaXMgcmVxdWlyZW1lbnQg
Pwo+Pj4KPj4+IFRoYW5rcwo+Pj4gSmlubG9uZyBNYW8KPj4+Cj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
