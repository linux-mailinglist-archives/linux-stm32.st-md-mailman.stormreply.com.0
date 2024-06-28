Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CBB91C8B2
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 23:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AAF4C71282;
	Fri, 28 Jun 2024 21:58:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63B43CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 21:58:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SL02oo016462;
 Fri, 28 Jun 2024 21:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0J2akENPIzOdoRjL2gN/Jt9bSjm4NMwCA+OZVI573+8=; b=Qirre7mHDVTOq+4Q
 hj1ZjF8KfOdtyBjca5GwZWPQnWbG8MIdc0UhdnR4nFpFJFg4rjcKID/9Y8Z9iqhw
 n3r2xKtTD3hWDp2siaVfpmpmv/Eci/fj6TA1sZmffQ1C6vB1+9nzqOqIY0lQ7zTq
 OxqqaoUlbvI/uvhayvoo75r0A50/FLD/jHzqhUmKaAJha/RD+hI1l0eDVT+z6q2u
 m99Nbk3mpK7RMPblh0ro/TRjmLylpYKX/Z3T6OLgTDnznil4dqXkEmHU27HYY7uw
 kaWKYlSeGTaU54otTmE+2wNVuIObmsWLKzyijCrCbDqDuG765UrBZIUqYJKXeJ75
 pOPGSg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm5twqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 21:58:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45SLwSfl007583
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 21:58:28 GMT
Received: from [10.110.112.228] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 14:58:25 -0700
Message-ID: <22edcb67-9c25-4d16-ab5c-7522c710b1e2@quicinc.com>
Date: Fri, 28 Jun 2024 14:58:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
 <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>
 <974114ca-98ed-44a7-a038-eb3f71bd03ef@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <974114ca-98ed-44a7-a038-eb3f71bd03ef@lunn.ch>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Ct61UG8KzFfDtH6q0f7ehA3guyUqO1k_
X-Proofpoint-GUID: Ct61UG8KzFfDtH6q0f7ehA3guyUqO1k_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280165
Cc: Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Jakub
 Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: stmmac: Add interconnect
	support
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

CgpPbiA2LzI2LzIwMjQgNToxMiBQTSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gT24gV2VkLCBKdW4g
MjYsIDIwMjQgYXQgMDQ6MzY6MDZQTSAtMDcwMCwgU2FnYXIgQ2hlbHV2ZWdvd2RhIHdyb3RlOgo+
Pgo+Pgo+PiBPbiA2LzI2LzIwMjQgNjowNyBBTSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+Pj4gKwlw
bGF0LT5heGlfaWNjX3BhdGggPSBkZXZtX29mX2ljY19nZXQoJnBkZXYtPmRldiwgImF4aSIpOwo+
Pj4+ICsJaWYgKElTX0VSUihwbGF0LT5heGlfaWNjX3BhdGgpKSB7Cj4+Pj4gKwkJcmV0ID0gKHZv
aWQgKilwbGF0LT5heGlfaWNjX3BhdGg7Cj4+Pgo+Pj4gQ2FzdGluZwl0byBhIHZvaWQgKiBzZWVt
cyBvZGQuIEVSUl9QVFIoKT8KPj4+Cj4+PiAJQW5kcmV3Cj4+Cj4+IFRoZSBvdXRwdXQgb2YgZGV2
bV9vZl9pY2NfZ2V0IGlzIGEgcG9pbnRlciBvZiB0eXBlIGljY19wYXRoLAo+PiBpIGFtIGdldHRp
bmcgYmVsb3cgd2FybmluZyB3aGVuIGkgdHJ5IHRvIEVSUl9QVFIgaW5zdGVhZCBvZiBWb2lkKgo+
PiBhcyBFUlJfUFRSIHdpbGwgdHJ5IHRvIGNvbnZlcnQgYSBsb25nIGludGVnZXIgdG8gYSBWb2lk
Ki4KPj4KPj4gIndhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhFUlJfUFRS4oCZIG1h
a2VzIGludGVnZXIgZnJvbSBwb2ludGVyIHdpdGhvdXQgYSBjYXN0Igo+Pgo+IAo+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEwLXJjNS9zb3VyY2UvZHJpdmVycy9jcnlwdG8v
cWNlL2NvcmUuYyNMMjI0Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTAt
cmM1L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jI0w1OTEKPiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMC1yYzUvc291cmNlL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMjTDU5Nwo+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjEwLXJjNS9zb3VyY2UvZHJpdmVycy9zcGkvc3BpLXF1cC5jI0wxMDUy
Cj4gCj4gU29ycnksIFBUUl9FUlIoKS4KPiAKPiBJbiBnZW5lcmFsLCBhIGNhc3QgdG8gYSB2b2lk
ICogaXMgYSByZWQgZmxhZyBhbmQgd2lsbCBnZXQgbG9va2VkCj4gYXQuIEl0IGlzIGdlbmVyYWxs
eSB3cm9uZy4gU28geW91IG1pZ2h0IHdhbnQgdG8gZml4dXAgd2hlcmUgZXZlciB5b3UKPiBjb3Bp
ZWQgdGhpcyBmcm9tLgo+IAo+IAlBbmRyZXcKdGhlIHJldHVybiB0eXBlIG9mIHN0bW1hY19wcm9i
ZV9jb25maWdfZHQgaXMgYSBwb2ludGVyIG9mIHR5cGUgcGxhdF9zdG1tYWNlbmV0X2RhdGEsCmFz
IFBUUl9FUlIgd291bGQgZ2l2ZSBsb25nIGludGVnZXIgdmFsdWUgaSBkb24ndCB0aGluayBpdCB3
b3VsZCBiZSBpZGVhbCB0bwpyZXR1cm4gYW4gaW50ZWdlciB2YWx1ZSBoZXJlLCBpZiBjYXN0aW5n
IHBsYXQtPmF4aV9pY2NfcGF0aCB0byBhIHZvaWQgKiBkb2Vzbid0IGxvb2sKZ29vZCwgbGV0IG1l
IGlmIHRoZSBiZWxvdyBzb2x1dGlvbiBpcyBiZXR0ZXIgb3Igbm90PwoKCiAJcGxhdC0+YXhpX2lj
Y19wYXRoID0gZGV2bV9vZl9pY2NfZ2V0KCZwZGV2LT5kZXYsICJheGkiKTsKCWlmIChJU19FUlIo
cGxhdC0+YXhpX2ljY19wYXRoKSkgewoJCXJjID0gUFRSX0VSUihwbGF0LT5heGlfaWNjX3BhdGgp
OwoJCXJldCA9IEVSUl9QVFIocmMpOwoJCWdvdG8gZXJyb3JfaHdfaW5pdDsKCX0KCglwbGF0LT5h
aGJfaWNjX3BhdGggPSBkZXZtX29mX2ljY19nZXQoJnBkZXYtPmRldiwgImFoYiIpOwoJaWYgKElT
X0VSUihwbGF0LT5haGJfaWNjX3BhdGgpKSB7CgkJcmMgPSBQVFJfRVJSKHBsYXQtPmFoYl9pY2Nf
cGF0aCk7CgkJcmV0ID0gRVJSX1BUUihyYyk7CgkJZ290byBlcnJvcl9od19pbml0OwoJfQoKCXBs
YXQtPnN0bW1hY19yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsKCZwZGV2LT5k
ZXYsCgkJCQkJCQkgICBTVE1NQUNfUkVTT1VSQ0VfTkFNRSk7CglpZiAoSVNfRVJSKHBsYXQtPnN0
bW1hY19yc3QpKSB7CgkJcmV0ID0gcGxhdC0+c3RtbWFjX3JzdDsKCQlnb3RvIGVycm9yX2h3X2lu
aXQ7Cgl9CgoJcGxhdC0+c3RtbWFjX2FoYl9yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29w
dGlvbmFsX3NoYXJlZCgKCQkJCQkJCSZwZGV2LT5kZXYsICJhaGIiKTsKCWlmIChJU19FUlIocGxh
dC0+c3RtbWFjX2FoYl9yc3QpKSB7CgkJcmV0ID0gcGxhdC0+c3RtbWFjX2FoYl9yc3Q7CgkJZ290
byBlcnJvcl9od19pbml0OwoJfQoKCXJldHVybiBwbGF0OwoKZXJyb3JfaHdfaW5pdDoKCWNsa19k
aXNhYmxlX3VucHJlcGFyZShwbGF0LT5wY2xrKTsKZXJyb3JfcGNsa19nZXQ6CgljbGtfZGlzYWJs
ZV91bnByZXBhcmUocGxhdC0+c3RtbWFjX2Nsayk7CgoJcmV0dXJuIHJldDsKfQoKUmVnYXJkcywK
U2FnYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
