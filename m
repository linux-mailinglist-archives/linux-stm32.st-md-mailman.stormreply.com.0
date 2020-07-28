Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F7230413
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jul 2020 09:27:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0515C36B27;
	Tue, 28 Jul 2020 07:27:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 462D0C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 07:27:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S7I0mM015172; Tue, 28 Jul 2020 09:27:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=L908e2AdQSAptw2MG0+5KEEyg20P0DnrpSzY3TXAojs=;
 b=z00tIkugcratI9e5e77HQjJo3ixY/oHxNREc9N4lcN5UzKrNzBPI0m9+aTks0zETaszu
 ydeTDMAExij1wXWKKUz37quocYSk3p4XsbdmC6mjXqaPmDRf3BLHDlIxBJtXbNb6p3g4
 MUvyqlAM4iumBCxTPVJCOwPPiE543J63KLul1mzH5kvL2qrE55a1VjH2zUMPiPBbYec3
 M4AefGRuV4Gfh6JoBihACujluFq8q3hQEWNIUI7CATa5oSytZj/uI5g6yJZ4gJ6NP2P2
 hwk2d5XcOkLrrtoEzd/qxVLNBz6MGGn3XASQ3e6HcM10B7VT9Q7cSqCthJkSl7SYe3Zr vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmg4q00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:27:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8562A100034;
 Tue, 28 Jul 2020 09:27:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7063121F0BF;
 Tue, 28 Jul 2020 09:27:38 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 09:27:37 +0200
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20200727092346.19780-1-amelie.delaunay@st.com>
 <20200727092346.19780-4-amelie.delaunay@st.com>
 <CAFBinCCXuUC4PHgrobYjj=yjA3Tz73Wwx0KWz+B6PfCw_OSi_w@mail.gmail.com>
 <CAHp75Ve75d+K87cokb4YYgim_wU0gTidGuiPs3BmohRKfTh5gA@mail.gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <19ba2fe3-56d1-32a9-3897-27a36ab58c2c@st.com>
Date: Tue, 28 Jul 2020 09:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve75d+K87cokb4YYgim_wU0gTidGuiPs3BmohRKfTh5gA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: Felipe Balbi <balbi@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 3/3] usb: dwc2: don't use ID/Vbus
 detection if usb-role-switch on STM32MP15 SoCs
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

SGksCgpPbiA3LzI3LzIwIDk6NDQgUE0sIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiBPbiBNb24s
IEp1bCAyNywgMjAyMCBhdCAxMDowNCBQTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCj4gPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+PiBPbiBNb24sIEp1bCAyNywgMjAy
MCBhdCAxMToyMyBBTSBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBzdC5jb20+IHdy
b3RlOgo+IAo+PiA+IC3CoMKgwqDCoMKgwqAgcC0+YWN0aXZhdGVfc3RtX2lkX3ZiX2RldGVjdGlv
biA9IHRydWU7Cj4+ID4gK8KgwqDCoMKgwqDCoCBwLT5hY3RpdmF0ZV9zdG1faWRfdmJfZGV0ZWN0
aW9uID0KPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG5wLCAidXNiLXJvbGUtc3dpdGNoIik7Cj4+IHRoZSByZXN0IG9mIHBhcmFtcy5jIHVz
ZXMgZGV2aWNlX3Byb3BlcnR5X3JlYWRfKiBpbnN0ZWFkIG9mIG9mX3JlYWRfcHJvcGVydHlfKgo+
PiBJIHRob3VnaHQgSSdkIG1lbnRpb24gaXQgc28geW91IGNhbiBkZWNpZGUgeW91cnNlbGYgd2hl
dGhlciB0aGlzIGlzCj4+IGZpbmUgb3IgbmVlZHMgdG8gYmUgY2hhbmdlZAo+IAo+IEJldHRlciB0
byBjaGFuZ2UgYW5kIGxlYXZlIGFsbCBvbiBvbmUgbGluZS4KPiAKClRoYW5rIHlvdSBib3RoIGZv
ciB5b3VyIHJldmlldy4gSSdsbCBjaGFuZ2UgaXQgaW4gdXBjb21pbmcgdjUuIEknbSBzdGlsbCAK
bm90IHVzZWQgdG8gZXhjZWVkIHRoZSA4MCBjb2x1bW5zIDopCgpSZWdhcmRzLApBbWVsaWUKCj4g
LS0gCj4gV2l0aCBCZXN0IFJlZ2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
