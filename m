Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1FAEDC30
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 14:02:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF6D7C32E8F;
	Mon, 30 Jun 2025 12:02:43 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D58DC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 12:02:42 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAmwnf029679;
 Mon, 30 Jun 2025 14:02:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 v1NgvuOJViNQoQa3YdxL37LV+10hlKR/k1LPKw76dTU=; b=D1hgo3sdFbaC2Bbs
 9lLvzpaYsrXuOOHj40rLw8GUtIv69bF8So+wuyY4i5FosAPKndrnwhtcTubgkesG
 csIa/1FLZkF6RZKb/OOaXseiCArM5OmD37WhIZ1Zqfk9vLAtvqYfnTI9sUhVULh9
 TmXkQVS7m2hYFDwlkSZky7qd0ZC/rmGeMtplj5c2oOcPavL9o8QZmMC9/U8LN4gY
 mJS4QjM9A5IPrYet6UyalO/UwZspUccurR++cth9P0Y73MpzwDRHSRymCf9G1LxP
 SLspA/qgYu9rujKTdNHXO+yFWu9XeTMDd0yadDs6S1T+Sly0nCl4nWgLCmcghLja
 nPr6Ag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubnmt6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 14:02:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D0EA24004D;
 Mon, 30 Jun 2025 14:01:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2415B2B8D1;
 Mon, 30 Jun 2025 14:00:51 +0200 (CEST)
Received: from [10.252.20.7] (10.252.20.7) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 14:00:51 +0200
Message-ID: <3d4d0eb4-a9ec-4fb2-be9c-4d8999cfeebb@foss.st.com>
Date: Mon, 30 Jun 2025 14:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mark Brown <broonie@kernel.org>
References: <20250630081253.17294-1-antonio@mandelbit.com>
 <5e61da51-cd02-41fd-9773-8bd776e1db62@foss.st.com>
 <192fb276-1e5a-4f69-8815-133f6bcd36b3@sirena.org.uk>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <192fb276-1e5a-4f69-8815-133f6bcd36b3@sirena.org.uk>
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Antonio Quartulli <antonio@mandelbit.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: fix pointer-to-pointer
	variables usage
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

T24gNi8zMC8yNSAxMzoyMCwgTWFyayBCcm93biB3cm90ZToKPiBPbiBNb24sIEp1biAzMCwgMjAy
NSBhdCAxMDoyODo1MEFNICswMjAwLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPiAKPj4gVGhh
bmsgeW91LCBMR1RNCj4+IFlvdSBjYW4gYWRkIG15IFJldmlld2VkLWJ5Cj4gCj4gSWYgeW91IHdh
bnQgdG8gYWRkIGEgUmV2aWV3ZWQtYnkgeW91IHNob3VsZCBhY3R1YWxseSB3cml0ZSBpdCBvdXQg
aW4gdGhlCj4gbWFpbCwgcGVvcGxlIHJlbHkgb24gdG9vbGluZyBsaWtlIGI0IHRvIHBpY2sgdGhl
bSB1cC4KClllcywgc29ycnkuCkZpeGVkIGl0LgoKQmVzdCByZWdhcmRzLApDbMOpbWVudApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
