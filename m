Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3514E48D530
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jan 2022 10:57:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D697DC5F1F5;
	Thu, 13 Jan 2022 09:57:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E8F6C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 09:57:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D7k9qV024293;
 Thu, 13 Jan 2022 10:57:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yHEJ9y2I9Ge5c7kYI6alfueclq+ZM0p0Ht8YLzDrn0M=;
 b=pLdBVar0Hw3Z/4fZL8Y1kSvbfC4vbNDiHuiefH3CI4XWhL37Wy3ncIT4A3UVEPdEMFU3
 mWIgk2vCjrkIe1lmTGXveeTeQpgrrwFWzG1VIz9Tolk0sKGDQj8Ugg3kYFJWhC174s/t
 rPFiRIDPcc45M9AeP6++cUMtquZVKhdMf+d6fpiE9bQe7L8Q1LX0/DeIQkfh5Fr50+DX
 Z4mlgy/YRDGJZZnOiLHQBQRNyHJxxxwcU3sEbFpsPA5pY+NjbfSqsjk4+8O3MjqnVA4k
 TzWuXJbOSrGR+K0Pjw9aN94bBtMxuPfL3tijt57z1piYLzyTEqfWB5CYaeduCYKb2vKS Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djfywrt4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 10:57:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6873810003A;
 Thu, 13 Jan 2022 10:57:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6137620C0F4;
 Thu, 13 Jan 2022 10:57:03 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 10:57:02 +0100
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214750.20105-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <71eb2c1d-e2d6-7c4a-e66d-3f43c296eac7@foss.st.com>
Date: Thu, 13 Jan 2022 10:57:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214750.20105-1-yannick.fertre@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_02,2022-01-13_01,2021-12-02_01
Subject: Re: [Linux-stm32] [PATCH 2/5] drm/stm: ltdc: add YCbCr 422 output
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

Ck9uIDEyLzE1LzIxIDEwOjQ3IFBNLCBZYW5uaWNrIEZlcnRyZSB3cm90ZToKPiBMVERDIDQwMTAw
IGh3IHZlcnNpb24gc3VwcG9ydHMgdGhlIFlDYkNyIDQyMiBvdXRwdXQsCj4gcmVkdWNpbmcgdGhl
IG91dHB1dCBwaW5zIGZyb20gMjQgdG8gMTYuIFRoaXMgZmVhdHVyZQo+IGlzIHVzZWZ1bCBmb3Ig
c29tZSBleHRlcm5hbCBkZXZpY2VzIGxpa2UgSERNSSBicmlkZ2VzLgo+Cj4gQm90aCBJVFUtUiBC
VC42MDEgJiBJVFUtUiBCVC43MDkgYXJlIHN1cHBvcnRlZC4KPgo+IEl0IGlzIGFsc28gcG9zc2li
bGUgdG8gY2hvb3NlIHRoZSBjaHJvbWluYW5jZSBvcmRlciBiZXR3ZWVuCj4gKiBDYiBpcyBvdXRw
dXQgZmlyc3QgKFkwQ2IsIHRoZW4gWTFDciwgWTJDYiBhbmQgc28gb24pLgo+ICogQ3IgaXMgb3V0
cHV0IGZpcnN0IChZMENyLCB0aGVuIFkxQ2IsIFkyQ3IgYW5kIHNvIG9uKS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaCB8ICAxICsKPiAg
MiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgoKSGVsbG8g
WWFubmljaywKCgpSZXZpZXdlZC1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxs
YWlzLXBvdUBmb3NzLnN0LmNvbT4KClRoYW5rcywKClJhcGhhw6tsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
