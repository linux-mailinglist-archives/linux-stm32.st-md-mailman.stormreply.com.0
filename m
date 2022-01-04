Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 787464842D5
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jan 2022 14:53:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B16CC5F1F9;
	Tue,  4 Jan 2022 13:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4228C5F1F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 13:53:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 204BGtgI030769;
 Tue, 4 Jan 2022 14:53:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6DXfUuCUuY+kw2PWfLjIaZioIffccgRObgTavevXpBM=;
 b=h0uDtQ8N/c5HFekp/6UCxu5ruxb+Jyi01lZQubNaiCljLFoQYECbME5ByaiTKGQZCOM3
 RHIc8ypH84RblSjrwJLUkKftqJfBG1s5VVgs3q40Tvu3CqUXCf2zqpVhQ7d0tfaT0IaC
 AU6DM/SEGaRxie7DvYdh4X3uTg0Hbtefui30NnF9e34yeLFx7YupqG9t9CrDDb5Y2McX
 ZjBEnh2pyTSp1ovgNWYZxT6BRdGZprqNNWAZIvZk+qqcsfoAZrMfRHPl63NT2a8EPGV0
 MG9ee6lXnPsKEbjEC9pOwEy1uJqFIz3kUs4clYw+78oV6pbbC3A07NYchhA2oiH+GNlD 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dcewm29cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:53:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDC9810002A;
 Tue,  4 Jan 2022 14:53:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5583242426;
 Tue,  4 Jan 2022 14:53:35 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan
 2022 14:53:35 +0100
From: Philippe CORNU <philippe.cornu@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211203085618.11314-1-yannick.fertre@foss.st.com>
 <73ed4015-c707-53e5-394f-c74cd2f69df2@foss.st.com>
Message-ID: <a7cffc9a-1cf4-8900-22f8-fe2826198b3a@foss.st.com>
Date: Tue, 4 Jan 2022 14:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <73ed4015-c707-53e5-394f-c74cd2f69df2@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_06,2022-01-04_01,2021-12-02_01
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: support of new hardware
	version
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

CgpPbiAxMi8xNC8yMSAxMToxOSBBTSwgUGhpbGlwcGUgQ09STlUgd3JvdGU6Cj4gCj4gCj4gT24g
MTIvMy8yMSA5OjU2IEFNLCBZYW5uaWNrIEZlcnRyZSB3cm90ZToKPj4gQWRkIHN1cHBvcnQgb2Yg
bmV3IGhhcmR3YXJlIHZlcnNpb24gMHg0MDEwMC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWWFubmlj
ayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAxNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaCB8wqDCoCAzICstCj4+IMKg
IDIgZmlsZXMgY2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+Pgo+
IAo+IEhpIFlhbm5pY2ssCj4gVGhpcyBsb29rcyBncmVhdCwgbWFueSB0aGFua3MgZm9yIHlvdXIg
cGF0Y2guCj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0
LmNvbT4KPiBQaGlsaXBwZSA6LSkKCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4KTWFueSB0aGFu
a3MgZm9yIHlvdXIgcGF0Y2gsClBoaWxpcHBlIDotKQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
