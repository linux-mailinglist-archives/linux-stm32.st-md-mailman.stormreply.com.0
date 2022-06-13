Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D496E548156
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 10:15:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9820CC6047C;
	Mon, 13 Jun 2022 08:15:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F724C03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 08:15:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D2DrHF009489;
 Mon, 13 Jun 2022 10:15:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2jPMFCFi0BBGHxBZTXR7BgbxjmNy1phYwPLYn9sIx+I=;
 b=fycCi7tuCzPCsk/AGUc3qGuLzwcUAF+6E5uQ4mlnI0fz2Ixwd1blkhTmZEjxRE0HfYWY
 igQmzsumf53gQ5ID3fFg/+KCJcEv+F0IY/dY3MXnJcEkHpJAlo+Oo0mLf4+VYlNuTIDw
 w9j4sXnLzKD5KOSaliD5KAlJJcgI6LbDvYrQBxcfnI/lKyW8ANM9/R0GZYYTZcg9zgGD
 32SoLa02gf+LaUAg4QMom0Zf74qsEgFMlCxEtTqXe+33eo47/chHZGRSG1XgmDRKdx3B
 c0YNScwKX/VfVO0B4TecF81XCdeugQk3X68PJ63E0R3DVDqjdhA8vHRY1Oe0zbKFIglK ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmg6a2jp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 10:15:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FA7610002A;
 Mon, 13 Jun 2022 10:15:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B1B72128AD;
 Mon, 13 Jun 2022 10:15:12 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.116) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 13 Jun
 2022 10:15:10 +0200
Message-ID: <cd9121fb-4953-2a06-5a48-728dc4ca6caa@foss.st.com>
Date: Mon, 13 Jun 2022 10:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
 <20220603094422.2112746-2-l.goehrs@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220603094422.2112746-2-l.goehrs@pengutronix.de>
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_02,2022-06-09_02,2022-02-23_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: correct vcc-supply
 for eeprom on stm32mp15xx-osd32
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

SGkKCk9uIDYvMy8yMiAxMTo0NCwgTGVvbmFyZCBHw7ZocnMgd3JvdGU6Cj4gQWNjb3JkaW5nIHRv
IHRoZSBPU0QzMk1QMSBQb3dlciBTeXN0ZW0gb3ZlcnZpZXdbMV0gdGhlIEVFUFJPTSBpcyBjb25u
ZWN0ZWQgdG8KPiB0aGUgVkREIGxpbmUgYW5kIG5vdCB0byBzb21lIHNpbmdsZS1wdXJwb3NlIGZp
eGVkIHJlZ3VsYXRvci4KPiBTZXQgdGhlIEVFUFJPTSBzdXBwbHkgYWNjb3JkaW5nIHRvIHRoZSBk
aWFncmFtIHRvIGVsaW1pbmF0ZSB0aGlzIHBhcmVudC1sZXNzCj4gcmVndWxhdG9yLgo+IAo+IFsx
XTogaHR0cHM6Ly9vY3Rhdm9zeXN0ZW1zLmNvbS9hcHBfbm90ZXMvb3NkMzJtcDEtcG93ZXItc3lz
dGVtLW92ZXJ2aWV3LyNjb25uZWN0aW9ucwo+IAo+IFNpZ25lZC1vZmYtYnk6IExlb25hcmQgR8O2
aHJzIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNXh4LW9zZDMyLmR0c2kgfCA4ICstLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNXh4LW9zZDMyLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTV4eC1vc2QzMi5kdHNpCj4gaW5kZXggZTk5N2M0OTUzZmQxLi45MzViNzA4NGI1YTIgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaQo+ICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LW9zZDMyLmR0c2kKPiBAQCAtNTAsMTIg
KzUwLDYgQEAgcmV0cmFtOiByZXRyYW1AMzgwMDAwMDAgewo+ICAgCQkJbm8tbWFwOwo+ICAgCQl9
Owo+ICAgCX07Cj4gLQo+IC0JcmVnX3NpcF9lZXByb206IHJlZ3VsYXRvcl9lZXByb20gewo+IC0J
CWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPiAtCQlyZWd1bGF0b3ItbmFtZSA9ICJz
aXBfZWVwcm9tIjsKPiAtCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwo+IC0JfTsKPiAgIH07Cj4gICAK
PiAgICZpMmM0IHsKPiBAQCAtMjA0LDcgKzE5OCw3IEBAIHBtaWNfd2F0Y2hkb2c6IHdhdGNoZG9n
IHsKPiAgIAo+ICAgCXNpcF9lZXByb206IGVlcHJvbUA1MCB7Cj4gICAJCWNvbXBhdGlibGUgPSAi
YXRtZWwsMjRjMzIiOwo+IC0JCXZjYy1zdXBwbHkgPSA8JnJlZ19zaXBfZWVwcm9tPjsKPiArCQl2
Y2Mtc3VwcGx5ID0gPCZ2ZGQ+Owo+ICAgCQlyZWcgPSA8MHg1MD47Cj4gICAJfTsKPiAgIH07CgpB
cHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFua3MuCkFsZXgKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
