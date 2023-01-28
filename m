Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D667F985
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Jan 2023 17:23:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DAA6C6907A;
	Sat, 28 Jan 2023 16:23:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A018C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jan 2023 16:23:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30S3Z2kD004555
 for <linux-stm32@st-md-mailman.stormreply.com>; Sat, 28 Jan 2023 17:23:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=hhNfsA91FwHQALspCRGbrDWuPbMeATNGm1Hbk8bq8FY=;
 b=UB0kKW5UnqXqZTqkWgZQSzIhgfhT1Z/tXsoAF0zkrZulb608bD+MqwIval0W7HKTaQfB
 Ye+UjL4ecyNhFx34yE1M8u2mFuQ62trcWiV4BwytNrxNCZ16Efkn/gqCaniu5guHoyzS
 BQERR9aiwlnHG5U42etXVCbQNnM85e5pCi5P5Zl8nxV83w/3ym8NtRD773db7n7AA4q7
 OydcwfU8AiyafH/h6MpB6fpZpJthB653fWtPVMBfs1d5WDzNRn2Lj4sE++h3cuX4s+0x
 WtTO7Cz2Pdr3c72denld9IApNmY/KMuGhPBTfgCDl7HkmFdbOfBscfZprdjj8K07J3+E 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ncux6t5fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Sat, 28 Jan 2023 17:23:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1768810002A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jan 2023 17:23:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DBC7216EE4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jan 2023 17:23:30 +0100 (CET)
Received: from [192.168.8.15] (10.252.29.34) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Sat, 28 Jan
 2023 17:23:28 +0100
Message-ID: <f7f83579a13147cba5a01bd9a4697418e60340a3.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Sat, 28 Jan 2023 17:23:27 +0100
In-Reply-To: <20230127164040.1047583-5-gatien.chevallier@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-5-gatien.chevallier@foss.st.com>
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
X-Originating-IP: [10.252.29.34]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-28_08,2023-01-27_01,2022-06-22_01
Cc: arnaud.pouliquen@foss.st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 4/6] bus: stm32_sys_bus: add support
 for STM32MP15 and STM32MP13 system bus
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGll
bi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgoKPCBzbmlwID4KCitzdGF0aWMgY29uc3Qgc3RydWN0
IHN0bTMyX3N5c19idXNfbWF0Y2hfZGF0YSBzdG0zMm1wMTVfc3lzX2J1c19kYXRhID0geworwqDC
oMKgwqDCoMKgwqAubWF4X2VudHJpZXMgPSBTVE0zMk1QMTVfRVRaUENfRU5UUklFUywKK307CisK
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3RtMzJfc3lzX2J1c19tYXRjaF9kYXRhIHN0bTMybXAxM19z
eXNfYnVzX2RhdGEgPSB7CivCoMKgwqDCoMKgwqDCoC5tYXhfZW50cmllcyA9IFNUTTMyTVAxM19F
VFpQQ19FTlRSSUVTLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3Rt
MzJfc3lzX2J1c19vZl9tYXRjaFtdID0geworwqDCoMKgwqDCoMKgwqB7IC5jb21wYXRpYmxlID0g
InN0LHN0bTMybXAxNS1zeXMtYnVzIiwgLmRhdGEgPSAmc3RtMzJtcDE1X3N5c19idXNfZGF0YSB9
LAorwqDCoMKgwqDCoMKgwqB7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAxMy1zeXMtYnVzIiwg
LmRhdGEgPSAmc3RtMzJtcDEzX3N5c19idXNfZGF0YSB9LAorwqDCoMKgwqDCoMKgwqB7fQorfTsK
CkdhdGllbiwKCkFzIEkgYWxyZWFkeSBzYWlkLCB0aGVyZSBpcyBubyByZWFzb24gdG8gdXNlIHR3
byBjb21wYXRpYmxlcyAoYW5kIGxhdGVyIGFkZGluZyBtb3JlIGZvciBldmVyeSBuZXcgU29DKSBm
b3Igc2VsZWN0aW5nICdtYXhfZW50cmllcycuClRoZSB2YWx1ZSAnbWF4X2VudHJpZXMnIGNhbiBi
ZSBlYXNpbHkgZXh0cmFjdGVkIGR1cmluZyBkcml2ZXIncyBwcm9iZSBmcm9tIE5VTV9QRVJfU0VD
IGZpZWxkIGluIEVUWlBDX0hXQ0ZHUlsxNTo4XS4KTm8gbmVlZCB0byBoYXJkY29kZSBpdCBpbiB0
aGUgZHJpdmVyCgpUaGUgZ2VuZXJpYyBjb21wYXRpYmxlIGNhbiBldmVuIGJlICdzdCxzdG0zMi1l
dHpwYy1zeXMtYnVzJyBvciBzaW1wbHkgJ3N0LHN0bTMyLWV0enBjJy4KCkFudG9uaW8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
