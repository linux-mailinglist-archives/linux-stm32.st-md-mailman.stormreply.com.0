Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F2C442BE3
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 11:54:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E629BC5AB60;
	Tue,  2 Nov 2021 10:54:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7570CC5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 10:54:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A27KWag027459;
 Tue, 2 Nov 2021 11:54:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F3zslvwLhHMv15l+DDp1BP8HK4d2H8Odbk6ORCpvSWM=;
 b=4+RNds1W1D6p9AXQqCyxrSLALcHZ+vLrsPJBZ6WVQvxYuznQMcqnGuUfK0jJJ4il4Rly
 xbUyNvUWI3JyFe05zy6gkdA0lmP9g7m6o83G+kCa/07678UqBsjgQSo5g3b7b5CS/NaZ
 APLE+CEwYIj3DpVyxlYJ4mWiDmx4WHjtMtW5rvXn4RCHPpYm3KxkBkJ7YrQ3D9y6quIq
 CV994KH5lLOUKVamJtmocmLDT/ialwaRUM3SY2ncGC7O1N7ivEVZ5xJ28JYfP53kwLyv
 BuHiPDQ1KUS4fnMjWadXsieARNUDGVXJKetTj91+T0Ew0zrVI8IApapnALXthhN8wEdL rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30uvhbwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:54:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DC1210002A;
 Tue,  2 Nov 2021 11:54:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D729921667C;
 Tue,  2 Nov 2021 11:54:38 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov
 2021 11:54:38 +0100
To: Jiri Slaby <jirislaby@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
 <0b42eede-d909-1afb-f3fc-c4ee1e2fc0f4@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <dae498c3-3460-e493-564e-bc903e4aa5b8@foss.st.com>
Date: Tue, 2 Nov 2021 11:54:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0b42eede-d909-1afb-f3fc-c4ee1e2fc0f4@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
Cc: linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v10 0/2] Add rpmsg tty driver
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

SGkgSmlyaSwKCk9uIDExLzEvMjEgODoyNyBBTSwgSmlyaSBTbGFieSB3cm90ZToKPiBPbiAxNS4g
MTAuIDIxLCAxMTo0NiwgQXJuYXVkIFBvdWxpcXVlbiB3cm90ZToKPiAuLi4KPj4gwqAgZHJpdmVy
cy9ycG1zZy9ycG1zZ19jb3JlLmPCoMKgwqDCoMKgwqAgfMKgIDIxICsrKwo+PiDCoCBkcml2ZXJz
L3JwbXNnL3JwbXNnX2ludGVybmFsLmjCoMKgIHzCoMKgIDIgKwo+PiDCoCBkcml2ZXJzL3JwbXNn
L3ZpcnRpb19ycG1zZ19idXMuYyB8wqAgMTAgKysKPj4gwqAgZHJpdmVycy90dHkvS2NvbmZpZ8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMiArKwo+PiDCoCBkcml2ZXJzL3R0eS9NYWtl
ZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqAgZHJpdmVycy90dHkv
cnBtc2dfdHR5LmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAyNzQgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+PiDCoCBpbmNsdWRlL2xpbnV4L3JwbXNnLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxMCArKwo+IAo+IEhpLAo+IAo+IGNhcmUgdG8gYWRkIGFuIGVudHJ5IHRvIE1BSU5U
QUlORVJTIHRvbz8KClRoYXQncyBhIGdvb2QgcG9pbnQuIEkgd2lsbCBzZW5kIGEgcGF0Y2ggdG8g
cHJvcG9zZSBteXNlbGYgYXMgbWFpbnRhaW5lci4KClRoYW5rcywKQXJuYXVkCgo+IAo+IHRoYW5r
cywKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
