Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6342303E5D
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 14:16:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 918BDC57183;
	Tue, 26 Jan 2021 13:16:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BC0EC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 13:16:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10QDBudM001701; Tue, 26 Jan 2021 14:16:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xa70l9azV9gym1p2Ripu8D6jOM/EugA2+SDeRh0kXyk=;
 b=bi8dvUsDIojjZW9RBUV6RKY2HotQGbjq2Cbe6j/LhP3ck3z9ezQMoRCW3cHcDyT6EMGb
 q7jike30y135mSloXCFi9EwFiVmPweh9Gn9rWhvybj/YuUdum9gIrLMD2lSQv/DAmI2q
 GcImUFHmNAZ+nND5uCFsZ4CmCNGCvKgrT1o+YGiPkvKESqc01NVidoVB+DCk/phfZctp
 2rYgN9ERsO+zhwJIYADOqbs+6VERt8WGkTHfB/dKgw1bAM5JXiBVYuev7jVWqGF4iLQz
 ltvPA4MO1h1sSKzDlyBq0mVSBrlyOUyGaCwX5yXSIIwRPfEXaBg9/Y2vpiu6g4FAdDfm WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjn94de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 14:16:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF6FB10002A;
 Tue, 26 Jan 2021 14:16:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BEA7243718;
 Tue, 26 Jan 2021 14:16:20 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Jan
 2021 14:16:20 +0100
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20210114131524.3298-1-amelie.delaunay@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <9e6fe1ab-bbd7-e313-b491-570070be3e6e@foss.st.com>
Date: Tue, 26 Jan 2021 14:16:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114131524.3298-1-amelie.delaunay@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_07:2021-01-26,
 2021-01-26 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/3] ARM: stm32: USBPHYC updates on
	stm32mp15
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

SGkgQW3DqWxpZSwKCk9uIDEvMTQvMjEgMjoxNSBQTSwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+
IFRoaXMgc2VyaWVzIHVwZGF0ZXMgdXNicGh5YyBwYXJlbnQgYW5kIGNoaWxkIG5vZGVzIHRvIGZv
bGxvdyBsYXRlc3QgRFQKPiBiaW5kaW5ncy4KPiAKPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0g
c3F1YXNoIGFsbCBEVCBib2FyZCBwYXRjaGVzIGluIG9uZSBwYXRjaAo+IC0gdXBkYXRlIGFsc28g
bm9uLVNUIERUCj4gCj4gQW1lbGllIERlbGF1bmF5ICgzKToKPiAgICBBUk06IGR0czogc3RtMzI6
IGFkZCB1c2JwaHljIHZkZGExdjEgYW5kIHZkZGExdjggc3VwcGxpZXMgb24KPiAgICAgIHN0bTMy
bXAxNTEKPiAgICBBUk06IGR0czogc3RtMzI6IHJlbW92ZSB1c2JwaHljIHBvcnRzIHZkZGExdjEg
JiB2ZGRhMXY4IG9uIHN0bTMybXAxNQo+ICAgICAgYm9hcmRzCj4gICAgQVJNOiBkdHM6IHN0bTMy
OiBhZGQgI2Nsb2NrLWNlbGxzIHByb3BlcnR5IHRvIHVzYnBoeWMgbm9kZSBvbgo+ICAgICAgc3Rt
MzJtcDE1MQo+IAo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNpICAgICAgICAg
ICAgICAgICAgfCAzICsrKwo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Etc3Rpbmdl
cjk2LmR0c2kgICAgICAgfCA0IC0tLS0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdj
LWVkMS5kdHMgICAgICAgICAgICAgIHwgNCAtLS0tCj4gICBhcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTV4eC1kaGNvbS1kcmMwMi5kdHNpICAgICB8IDIgLS0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNXh4LWRoY29tLXBkazIuZHRzaSAgICAgIHwgNCAtLS0tCj4gICBhcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1waWNvaXR4LmR0c2kgICB8IDQgLS0tLQo+ICAgYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItYXZlbmdlcjk2LmR0c2kgfCA0IC0tLS0K
PiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRreC5kdHNpICAgICAgICAgICAgIHwg
NCAtLS0tCj4gICA4IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25z
KC0pCj4gCgpEVCBwYXRjaGVzIGFwcGxpZWQgb24gc3RtMzItbmV4dC4KClRoYW5rcwpBbGV4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
