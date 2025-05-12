Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9837AB3087
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE7F0C7A832;
	Mon, 12 May 2025 07:29:30 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41D92C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 05:26:47 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMhEAT023729;
 Mon, 12 May 2025 05:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=2at7qq
 hU5esJ06sT8kotxmCJGy7Nu/9DF9wojUpF83c=; b=pz/SPIB/Q1bE/pt0RmGEo/
 D0ljHvI+AKzNroeeljQvGdNz7Os7MTsKtV7kfjG14KdVDCWfIJGUMe2JAA1aS+/q
 s3GmwI3YY/LGdHbHHiQUGtcUOxurDgae/2MA8kkrHdte4KQXjx+FT47FrAkNxosg
 7wkZnSROMmBmcD111r00ELtWj/x+zByS1yohOrr+mmqxfw6ZCoq9MP+jI2EjStuG
 RIa/6NqAa6YgwIaY0FySYKLkm62yttlDt8Pm9kZrc8AMMi9dXnxGAIvQTAPN8a2/
 yPpc8GXkxSMEbW25V7mAw/yJAgOzgarvl4/9cV/dSIugDhd5Hs06tzilCyjUkAdg
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jw42t3wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 May 2025 05:26:11 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54C5QA5f010031;
 Mon, 12 May 2025 05:26:10 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jw42t3w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 May 2025 05:26:10 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54C0sLZi003815;
 Mon, 12 May 2025 05:26:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jkbkc8mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 May 2025 05:26:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 54C5Q6md42664284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 May 2025 05:26:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEF5920049;
 Mon, 12 May 2025 05:26:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE62D20040;
 Mon, 12 May 2025 05:26:01 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.109.219.153])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 12 May 2025 05:26:01 +0000 (GMT)
Date: Mon, 12 May 2025 10:55:59 +0530
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <aCGGZ9gApo+QwSMD@linux.ibm.com>
References: <20250509122348.649064-1-skb99@linux.ibm.com>
 <CAADnVQKBQqur68RdwbDVpRuAZE=8Y=_JaTFo-36d_4vr2DNVyw@mail.gmail.com>
 <20250510110455.10c72257@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250510110455.10c72257@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MiBTYWx0ZWRfX6PAao8iRodZj
 UUE+qgT+lDeH8UKRJ35gSDPgj8cT2qCVR0zMG3vXzFs7wbOWXfqo1KcXalLFUHkeeHgzeajIpOu
 GebwXRqG7xujIrvOsOdZuC/SNUkF6ymr9oYVfV/PYoix3CbHQKbJsH6daJ34BBqMUZnis3x5wRL
 1oZJC2MQD0QnREdB0sCv7PCYqGtAhjNlAzComfyrWzswh9/hUs8xeAtTCIWGFDHh5WKy53utmU0
 dDsXXw8SMAioBER2vKDp2ieY77YP7ZQkdU8IuhctfCaMrjqtp06uf0igeX3Gos8dgQwNrLWgbqy
 Tn6THDeNT2RYjwbu7x2/unKBz4xQH3DwOSOrmTZBhnJOH48ePR6VxAcrEHufqj38yw38XI6GzlW
 g63Psx+CoHdKaktaGTTFq7NvBIkpUJUDGnF8pAfOcIzDbpCRe8MYirZ0Cb0VrqQTVSpYQ+sg
X-Proofpoint-ORIG-GUID: L7wPwis5KOaSpF8fo9uroFggy_iUJ9Cx
X-Authority-Analysis: v=2.4 cv=UqJjN/wB c=1 sm=1 tr=0 ts=68218673 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=jz50gl9ZvO4mUITzFMAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5_qWnCPjlKW_qZJuRAUWEa0sM8S7BpV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120052
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Greg KH <greg@kroah.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Mykola Lysenko <mykolal@fb.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Stanislav Fomichev <sdf@fomichev.me>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 KP Singh <kpsingh@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Hao Luo <haoluo@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH] selftests/bpf: Fix bpf selftest build
	error
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

T24gU2F0LCBNYXkgMTAsIDIwMjUgYXQgMTE6MDQ6NTVBTSArMTAwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBBbGV4ZWksCj4gCj4gT24gRnJpLCA5IE1heSAyMDI1IDEwOjA0OjE4IC0w
NzAwIEFsZXhlaSBTdGFyb3ZvaXRvdiA8YWxleGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCA1OjI04oCvQU0gU2FrZXQgS3VtYXIg
Qmhhc2thciA8c2tiOTlAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIGxpbnV4
LW5leHQsIGJ1aWxkIGZvciBicGYgc2VsZnRlc3QgZGlzcGxheXMgYW4gZXJyb3IgZHVlIHRvCj4g
PiA+IG1pc21hdGNoIGluIHRoZSBleHBlY3RlZCBmdW5jdGlvbiBzaWduYXR1cmUgb2YgYnBmX3Rl
c3Rtb2RfdGVzdF9yZWFkCj4gPiA+IGFuZCBicGZfdGVzdG1vZF90ZXN0X3dyaXRlLgo+ID4gPgo+
ID4gPiBDb21taXQgOTdkMDY4MDJkMTBhICgic3lzZnM6IGNvbnN0aWZ5IGJpbl9hdHRyaWJ1dGUg
YXJndW1lbnQgb2YgYmluX2F0dHJpYnV0ZTo6cmVhZC93cml0ZSgpIikKPiA+ID4gY2hhbmdlZCB0
aGUgcmVxdWlyZWQgdHlwZSBmb3Igc3RydWN0IGJpbl9hdHRyaWJ1dGUgdG8gY29uc3Qgc3RydWN0
IGJpbl9hdHRyaWJ1dGUuCj4gPiA+Cj4gPiA+IFRvIHJlc29sdmUgdGhlIGVycm9yLCB1cGRhdGUg
Y29ycmVzcG9uZGluZyBzaWduYXR1cmUgZm9yIHRoZSBjYWxsYmFjay4KPiA+ID4KPiA+ID4gUmVw
b3J0ZWQtYnk6IFZlbmthdCBSYW8gQmFnYWxrb3RlIDx2ZW5rYXQ4OEBsaW51eC5pYm0uY29tPgo+
ID4gPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9lOTE1ZGE0OS0yYjlhLTRj
NGMtYTM0Zi04NzdmMzc4MTI5ZjZAbGludXguaWJtLmNvbS8KPiA+ID4gU2lnbmVkLW9mZi1ieTog
U2FrZXQgS3VtYXIgQmhhc2thciA8c2tiOTlAbGludXguaWJtLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jIHwg
NCArKy0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBm
L3Rlc3Rfa21vZHMvYnBmX3Rlc3Rtb2QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90
ZXN0X2ttb2RzL2JwZl90ZXN0bW9kLmMKPiA+ID4gaW5kZXggMmU1NGI5NWFkODk4Li4xOTRjNDQy
NTgwZWUgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0
X2ttb2RzL2JwZl90ZXN0bW9kLmMKPiA+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
YnBmL3Rlc3Rfa21vZHMvYnBmX3Rlc3Rtb2QuYwo+ID4gPiBAQCAtMzg1LDcgKzM4NSw3IEBAIGlu
dCBicGZfdGVzdG1vZF9mZW50cnlfb2s7Cj4gPiA+Cj4gPiA+ICBub2lubGluZSBzc2l6ZV90Cj4g
PiA+ICBicGZfdGVzdG1vZF90ZXN0X3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBrb2Jq
ZWN0ICprb2JqLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJpbl9hdHRyaWJ1
dGUgKmJpbl9hdHRyLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGJp
bl9hdHRyaWJ1dGUgKmJpbl9hdHRyLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgY2hhciAq
YnVmLCBsb2ZmX3Qgb2ZmLCBzaXplX3QgbGVuKSAgCj4gPiAKPiA+IFlvdSBkaWRuJ3QgZXZlbiBj
b21waWxlIGl0IDooCj4gPiAKPiA+IEluc3RlYWQgb2YgZml4aW5nIHRoZSBidWlsZCwgaXQgYnJl
YWtzIHRoZSBidWlsZC4KPiA+IAo+ID4gcHctYm90OiBjcgo+IAo+IFRoaXMgcGF0Y2ggaXMgb25s
eSBuZWVkZWQgaW4gbGludXgtbmV4dC4gIEl0IHNob3VsZCBiZSBhcHBsaWVkIHRvIHRoZQo+IGRy
aXZlci1jb3JlIHRyZWUgLSBzaW5jZSB0aGF0IGluY2x1ZGVzIGNvbW1pdCA5N2QwNjgwMmQxMGEu
ICBJdCBzaG91bGQKPiBhbHNvIGhhdmUgYSBGaXhlcyB0YWcgcmVmZXJlbmNpbmcgY29tbWl0IDk3
ZDA2ODAyZDEwYS4KPiAtLSAKPiBDaGVlcnMsCj4gU3RlcGhlbiBSb3Rod2VsbApIaSBTdGVwaGVu
LAoKQXBvbG9naWVzIGZvciBtaXNzaW5nIHRoZSBGaXhlcyB0YWcuIFdvdWxkIHlvdSBsaWtlIG1l
IHRvIHJlc2VuZCB0aGUgcGF0Y2ggd2l0aCB0aGUgCkZpeGVzIHRhZyBpbmNsdWRlZD8KClRoYW5r
cywKU2FrZXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
