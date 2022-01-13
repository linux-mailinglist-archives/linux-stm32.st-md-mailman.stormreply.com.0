Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE1048D460
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jan 2022 10:37:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEBDFC5F1F5;
	Thu, 13 Jan 2022 09:37:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C2C9C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 09:37:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D8S200016899;
 Thu, 13 Jan 2022 10:37:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Jr0kWY9uB9p4RjnCqgSrRBVIiTgElsIdkCEOg8QxsTA=;
 b=MtKA6cVOr3qfrzr6C1hmoORVpQHAkWONsiJ3xuq331e7FKLP/ccg9L/B2gf26rx8ICYS
 0U83ZDNDblU6skCyt8lOzkH/iC5I4jo3vEP3IKqa4uP5Z/O8oEL/4p03CKLJTzC5RksO
 mSwPTJHDsfsi0tOQ+FCchZeUZAbx1nnc5oax9Fadr93Xhv9Sn5VWTNmBZIdmQrTaxLOb
 LGYRG+AN8KXSfFkuVE37Wv53zX0Xrahwp8nm4DoAyKgy3jBOWMpo6k3KXaIgclrQaxZn
 najDeBfglhcv93hOfSmwt8gICZyN84RXWtaobVmt2VCB85Ohg7I59O60rWFF+i3vLGHD iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djgkkretb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 10:37:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FF6E100034;
 Thu, 13 Jan 2022 10:37:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5992020BA00;
 Thu, 13 Jan 2022 10:37:29 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 10:37:28 +0100
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214738.19946-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <87cd3111-75bd-e66c-5ba8-af3ff76bedad@foss.st.com>
Date: Thu, 13 Jan 2022 10:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214738.19946-1-yannick.fertre@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_02,2022-01-11_01,2021-12-02_01
Subject: Re: [Linux-stm32] [PATCH 1/5] drm/stm: ltdc: switch to regmap
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

Ck9uIDEyLzE1LzIxIDEwOjQ3IFBNLCBZYW5uaWNrIEZlcnRyZSB3cm90ZToKPiBSZXBsYWNlIHRo
ZSBsZWdhY3kgcmVnaXN0ZXIgYWNjZXNzIGJ5IHJlZ21hcCBBUEkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgMTM4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmggfCAgIDEgKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygtKQoKCkhlbGxvIFlh
bm5pY2ssCgpSZXZpZXdlZC1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlz
LXBvdUBmb3NzLnN0LmNvbT4KVGVzdGVkLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVs
LmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKVGhhbmtzIGZvciB0aGUgcGF0Y2gsCgpSYXBoYcOr
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
