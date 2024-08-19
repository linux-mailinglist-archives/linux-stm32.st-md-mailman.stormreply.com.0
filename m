Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC09560F0
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 03:49:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68513C6DD9D;
	Mon, 19 Aug 2024 01:49:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 615AAC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 01:49:46 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47IMvHRu002666;
 Mon, 19 Aug 2024 01:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B/oAQdAlYc+fVzegRfsOmC0hhMJRAvBOn3QYApnrE10=; b=filQ5NM+pgDf/HmF
 bH/Wm2S3xDJzIZ/+lNTsHanHTfSH6veE49CIybDziOpSV4ZPztkQQtvz//MjMSqT
 Lhn49T38cqeRCvm3MmOZWE334SvxyS5lxQh4isK5953xZO9A4zA/1Ha69dY/wAxm
 RrZtYIl75GjbfVIJ6SFOjVzgUkWVk+Y6cr68q+pM3zq0sYDG9WkGzWlwJAJ6xWZb
 HD21hVy+odr30hvc6b3/NUc29mMfHPZeuB1NSG9f7CT531KWaVOLl8nhsgRhjrZE
 GG61trKndwcKS+bszPdB9dE+CNabfW+UmJ/rGFBTuBxE9hZa3K/RiWdi4RVH9jNh
 RthmtA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412m32jn6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 01:49:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J1nP63011694
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 01:49:25 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 Aug 2024 18:49:19 -0700
Date: Mon, 19 Aug 2024 09:49:15 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <20240818142834.GA27754-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818142834.GA27754-robh@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FgV4sntAx5nC7_nJHd9ivOvQFGfo_Asd
X-Proofpoint-ORIG-GUID: FgV4sntAx5nC7_nJHd9ivOvQFGfo_Asd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-18_24,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190011
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 James Clark <james.clark@linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Song Chai <quic_songchai@quicinc.com>, Tao
 Zhang <quic_taozha@quicinc.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/5] dt-bindings: arm: Add Coresight
 TMC Control Unit hardware
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

T24gU3VuLCBBdWcgMTgsIDIwMjQgYXQgMDg6Mjg6MzRBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMTA6NDE6MzlBTSArMDgwMCwgSmllIEdhbiB3
cm90ZToKPiA+IEFkZCBiaW5kaW5nIGZpbGUgdG8gc3BlY2lmeSBob3cgdG8gZGVmaW5lIGEgQ29y
ZXNpZ2h0IFRNQwo+ID4gQ29udHJvbCBVbml0IGRldmljZSBpbiBkZXZpY2UgdHJlZS4KPiA+IAo+
ID4gSXQgaXMgcmVzcG9uc2libGUgZm9yIGNvbnRyb2xsaW5nIHRoZSBkYXRhIGZpbHRlciBmdW5j
dGlvbgo+ID4gYmFzZWQgb24gdGhlIHNvdXJjZSBkZXZpY2UncyBUcmFjZSBJRCBmb3IgVE1DIEVU
UiBkZXZpY2UuCj4gPiBUaGUgdHJhY2UgZGF0YSB3aXRoIHRoYXQgVHJhY2UgaWQgY2FuIGdldCBp
bnRvIEVUUidzIGJ1ZmZlcgo+ID4gd2hpbGUgb3RoZXIgdHJhY2UgZGF0YSBnZXRzIGlnbm9yZWQu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEppZSBHYW4gPHF1aWNfamllZ2FuQHF1aWNpbmMuY29t
Pgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL2FybS9xY29tLGNvcmVzaWdodC1jdGN1LnlhbWwg
ICAgIHwgNzkgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3OSBpbnNl
cnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vcWNvbSxjb3Jlc2lnaHQtY3RjdS55YW1sCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20sY29yZXNpZ2h0
LWN0Y3UueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbSxj
b3Jlc2lnaHQtY3RjdS55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi43YTk1ODAwMDc5NDIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbSxjb3Jlc2lnaHQtY3RjdS55YW1s
Cj4gPiBAQCAtMCwwICsxLDc5IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9hcm0vcWNvbSxjb3Jlc2lnaHQtY3Rj
dS55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBDb3JlU2lnaHQgVE1DIENvbnRyb2wgVW5pdAo+
ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBZdWFuZmFuZyBaaGFuZyA8cXVpY195dWFu
ZmFuZ0BxdWljaW5jLmNvbT4KPiA+ICsgIC0gTWFvIEppbmxvbmcgPHF1aWNfamlubG1hb0BxdWlj
aW5jLmNvbT4KPiA+ICsgIC0gSmllIEdhbiA8cXVpY19qaWVnYW5AcXVpY2luYy5jb20+Cj4gPiAr
Cj4gPiArZGVzY3JpcHRpb246Cj4gPiArICBUaGUgQ29yZXNpZ2h0IFRNQyBDb250cm9sIHVuaXQg
Y29udHJvbHMgdmFyaW91cyBDb3Jlc2lnaHQgYmVoYXZpb3JzLgo+ID4gKyAgSXQgd29ya3MgYXMg
YSBoZWxwZXIgZGV2aWNlIHdoZW4gY29ubmVjdGVkIHRvIFRNQyBFVFIgZGV2aWNlLgo+ID4gKyAg
SXQgaXMgcmVzcG9uc2libGUgZm9yIGNvbnRyb2xsaW5nIHRoZSBkYXRhIGZpbHRlciBmdW5jdGlv
biBiYXNlZCBvbgo+ID4gKyAgdGhlIHNvdXJjZSBkZXZpY2UncyBUcmFjZSBJRCBmb3IgVE1DIEVU
UiBkZXZpY2UuIFRoZSB0cmFjZSBkYXRhIHdpdGgKPiA+ICsgIHRoYXQgVHJhY2UgaWQgY2FuIGdl
dCBpbnRvIEVUUidzIGJ1ZmZlciB3aGlsZSBvdGhlciB0cmFjZSBkYXRhIGdldHMKPiA+ICsgIGln
bm9yZWQuCj4gCj4gTm93aGVyZSBpcyBUTUMgZGVmaW5lZC4KVGhlIENvcmVzaWdodCBUTUMgY29u
dHJvbCB1bml0KENUQ1UpIGNvbm5lY3RlZCB0byBDb3Jlc2lnaHQgVE1DIGRldmljZSB2aWEgcmVw
bGljYXRvciBhbmQKd29ya3MgYXMgYSBoZWxwZXIgZGV2aWNlIHRvIFRNQyBkZXZpY2UuCgpUaGUg
aW4tcG9ydHMgbGlzdGVkIGJlbG93IGlsbHVzdHJhdGUgdGhlaXIgY29ubmVjdGlvbiB0byBUTUMg
ZGV2aWNlcy4KCj4gCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4g
PiArICAgIGVudW06Cj4gPiArICAgICAgLSBxY29tLHNhODc3NXAtY3RjdQo+ID4gKwo+ID4gKyAg
cmVnOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgY2xvY2tzOgo+ID4gKyAgICBt
YXhJdGVtczogMQo+ID4gKwo+ID4gKyAgY2xvY2stbmFtZXM6Cj4gPiArICAgIGl0ZW1zOgo+ID4g
KyAgICAgIC0gY29uc3Q6IGFwYgo+ID4gKwo+ID4gKyAgaW4tcG9ydHM6Cj4gCj4gVXNlICdwb3J0
cycgdW5sZXNzIHlvdSBoYXZlIGJvdGggaW4gYW5kIG91dCBwb3J0cy4KVGhlIOKAmGluLXBvcnRz
4oCZIGFuZCDigJhvdXQtcG9ydHPigJkgcHJvcGVydGllcyB3aWxsIGJlIHBhcnNlZCBieSDigJhv
Zl9jb3Jlc2lnaHRfZ2V0X3BvcnRfcGFyZW504oCZCmFuZCB0aGVpciByZWxhdGlvbnNoaXBzIHRv
IG90aGVyIGRldmljZXMgd2lsbCBiZSBzdG9yZWQgaW4gdGhlIGNvcmVzaWdodF9wbGF0Zm9ybV9k
YXRhIHN0cnVjdHVyZS4KCmZvciBleGFtcGxlOgpzdHJ1Y3QgY29yZXNpZ2h0X3BsYXRmb3JtX2Rh
dGEgewoJaW50IG5yX2luY29ubnM7CglpbnQgbnJfb3V0Y29ubnM7CglzdHJ1Y3QgY29yZXNpZ2h0
X2Nvbm5lY3Rpb24gKipvdXRfY29ubnM7CglzdHJ1Y3QgY29yZXNpZ2h0X2Nvbm5lY3Rpb24gKipp
bl9jb25uczsKfTsKCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjExLXJjNC9z
b3VyY2UvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1wbGF0Zm9ybS5jI0wx
NDcKCj4gCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9y
dHMKPiA+ICsKPiA+ICsgICAgcGF0dGVyblByb3BlcnRpZXM6Cj4gPiArICAgICAgJ15wb3J0KEBb
MC03XSk/JCc6Cj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogSW5wdXQgY29ubmVjdGlvbnMgZnJv
bSBDb3JlU2lnaHQgVHJhY2UgYnVzCj4gPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55
YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0
aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsgIC0gaW4tcG9ydHMKPiA+ICsKPiA+ICthZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAg
ICBjdGN1QDEwMDEwMDAgewo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJxY29tLHNhODc3NXAt
Y3RjdSI7Cj4gPiArICAgICAgICByZWcgPSA8MHgxMDAxMDAwIDB4MTAwMD47Cj4gPiArCj4gPiAr
ICAgICAgICBjbG9ja3MgPSA8JmFvc3NfcW1wPjsKPiA+ICsgICAgICAgIGNsb2NrLW5hbWVzID0g
ImFwYiI7Cj4gPiArCj4gPiArICAgICAgICBpbi1wb3J0cyB7Cj4gPiArICAgICAgICAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4g
PiArCj4gPiArICAgICAgICAgICAgcG9ydEAwIHsKPiA+ICsgICAgICAgICAgICAgICAgcmVnID0g
PDA+Owo+ID4gKyAgICAgICAgICAgICAgICBjdGN1X2luX3BvcnQwOiBlbmRwb2ludCB7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmV0cjBfb3V0X3BvcnQ+Owo+
ID4gKyAgICAgICAgICAgICAgICB9Owo+ID4gKyAgICAgICAgICAgIH07Cj4gPiArCj4gPiArICAg
ICAgICAgICAgcG9ydEAxIHsKPiA+ICsgICAgICAgICAgICAgICAgcmVnID0gPDE+Owo+ID4gKyAg
ICAgICAgICAgICAgICBjdGN1X2luX3BvcnQxOiBlbmRwb2ludCB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmV0cjFfb3V0X3BvcnQ+Owo+ID4gKyAgICAgICAg
ICAgICAgICB9Owo+ID4gKyAgICAgICAgICAgIH07Cj4gPiArICAgICAgICB9Owo+ID4gKyAgICB9
Owo+ID4gLS0gCj4gPiAyLjM0LjEKPiA+IAo+IAoKVGhhbmtzLApKaWUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
