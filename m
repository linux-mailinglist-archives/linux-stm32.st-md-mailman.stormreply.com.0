Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD02248D58F
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jan 2022 11:21:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D794C5F1F5;
	Thu, 13 Jan 2022 10:21:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7F5EC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 10:21:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20D8S77O017161;
 Thu, 13 Jan 2022 11:21:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4DuleFFceRfbztWmfYxXFQO+YBMNDqqrJdOpBXrPzcs=;
 b=u7QfE7iKoPzbNhsK2eB0TQJrDGBm30ie9dAkp+9S0Wa+VdUpNwoXjpgZ5sKwrrQmyaTH
 F//Ff9fsaxvEmNTASmhaD9ZExvAio81iyaQPBNNlYaWqG+3vU104WQ3WWOJ6klnyrE1I
 mn3Uja60eNt8Xsu32dW3S78C8w/2VX8jOvDACS6V1CIGXit5bmjXmC1knsYD59gQMn9D
 +D9Kcl7lEaaijjZnTvDuu11jzDvtpIRM9KBJvXA2ip7egjC0GyAsH5GjfEK4J1uTDNcG
 CjK42rS8AqxRlB3KJjpwFvBouzJ+KYccPJE6T3hD0vX7Er9lLFj3rSyK6ro77x+fwL+C Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djgkkrqmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 11:21:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E244D100034;
 Thu, 13 Jan 2022 11:21:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB1AB20D18E;
 Thu, 13 Jan 2022 11:21:06 +0100 (CET)
Received: from lmecxl1137.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan
 2022 11:21:06 +0100
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211215214835.20593-1-yannick.fertre@foss.st.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <9a718ddb-163b-6c9a-b83b-a52df94805cf@foss.st.com>
Date: Thu, 13 Jan 2022 11:21:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215214835.20593-1-yannick.fertre@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_02,2022-01-13_01,2021-12-02_01
Subject: Re: [Linux-stm32] [PATCH 4/5] drm/stm: ltdc: add support of
	flexible pixel formats
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

Ck9uIDEyLzE1LzIxIDEwOjQ4IFBNLCBZYW5uaWNrIEZlcnRyZSB3cm90ZToKPiBUaGlzIGZlYXR1
cmUgYWxsb3dzIHRoZSBnZW5lcmF0aW9uIG9mIGFueSBSR0IgcGl4ZWwgZm9ybWF0Lgo+IFRoZSBs
aXN0IG9mIHN1cHBvcnRlZCBmb3JtYXRzIGlzIG5vIGxvbmdlciBsaW5rZWQgdG8gdGhlCj4gcmVn
aXN0ZXIgTFhQRkNSX1BGLCB0aGF0IHRoZSByZWFzb24gd2h5IGEgbGlzdCBvZiBkcm0gZm9ybWF0
cyBpcwo+IGRlZmluZWQgZm9yIGVhY2ggZGlzcGxheSBjb250cm9sbGVyIHZlcnNpb24uCj4KPiBT
aWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgMTk2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmggfCAg
IDUgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNDUgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25z
KC0pCgoKSGVsbG8gWWFubmljaywKCgpSZXZpZXdlZC1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8
cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KVGVzdGVkLWJ5OiBSYXBoYWVsIEdhbGxh
aXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKTWFueSB0aGFua3MsIHRo
aXMgaXMgYW4gaW50ZXJlc3RpbmcgcGF0Y2guCgpSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
