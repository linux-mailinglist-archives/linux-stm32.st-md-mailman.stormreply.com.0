Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE3A2E7FD6
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Dec 2020 13:18:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34D0DC57188;
	Thu, 31 Dec 2020 12:18:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C678C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Dec 2020 12:18:07 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 190so7225392wmz.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Dec 2020 04:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7SqcNl5KWJPGbXH65bKbbN1vtS8pHNjLIp3wmAVPS+8=;
 b=F0Ty4zFCDW5DJIvU7G6DHJocno5RtfsBgnYkYnGMSK88ObGi0268Fnw/DLUJdepaxW
 A6ZQM3J5FWnOBndRIGfHhgmNDZ8q4i3o5tf84GZU3fndsYVjgVqrCelSI1OkFUpHDDV3
 OG9x14ceTTBlV+ytPQUQywLl0XlZMZvNir9NDn8eLY69sZY2NRW3Q7u+rIsAJ0/zRxGm
 E4uhdTVSWJSPn2/ljRClFbQZ4B/9efeoO1O8+hCOTBZEjGOgaQwN8E7EGQEPNITYr81Z
 qBQZdcB+FgEMd4ZvsrgDxCWat9IM7yeyBuU0v5X9ow3No6WxvbHtTKgq+G4vcCsHcGZK
 8QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7SqcNl5KWJPGbXH65bKbbN1vtS8pHNjLIp3wmAVPS+8=;
 b=drAWHJ1mbyyE5aIg51QOH6lCDDDWUqEMSPVL7Gy2vscwyRNpeTmrqFAVElRwXnL7iT
 owQQX9w63yiURP9aKFB0gp7Hdi3rJWc0yZs+NCWI6lqMOOW0vfDC+AwJRhz99NfF9z/+
 fnULlUeaAJODqxfSHMkIVhCcCC5t8RVuLNkogVM+0WTISIgul+pbeg9jVNPdq8P14FC/
 Kq0iZzd0EfOLcAAK5D2Amf4oJwhKFPsn+TV+0DTRWmYO8WJW8DfRqya6rom8FdbOKsaP
 5+INJEFYc6a2lU6Sm74F3v/8ZnW/etRv8IMLfQ4preQPLkhoTfwhRz22LuSxpsVwv8jE
 zeQA==
X-Gm-Message-State: AOAM532wzG53VDQEhi0HOdOrgoa+kr4jlKaIeOAA4n5hSl3VuOEngJEg
 e+PqTLeIDHUdAi75e4WmPvvK/w==
X-Google-Smtp-Source: ABdhPJyZpFCcTny/kpxj+lNXYT/J5a5zwnln/azNAkSLIx5BERCKXlTb9EROUOzJtMiXDd6c5BrYzg==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr11923999wmh.185.1609417086646; 
 Thu, 31 Dec 2020 04:18:06 -0800 (PST)
Received: from dell ([91.110.221.133])
 by smtp.gmail.com with ESMTPSA id a62sm12743892wmf.7.2020.12.31.04.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 04:18:05 -0800 (PST)
Date: Thu, 31 Dec 2020 12:18:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <20201231121803.GC4413@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz> <20201231083317.GB4413@dell>
 <20201231093945.GA22962@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201231093945.GA22962@amd>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 1/4] dt-bindings: mfd: Fix schema
	warnings for pwm-leds
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

T24gVGh1LCAzMSBEZWMgMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiA+ID4g
PiBUaGUgbm9kZSBuYW1lcyBmb3IgZGV2aWNlcyB1c2luZyB0aGUgcHdtLWxlZHMgZHJpdmVyIGZv
bGxvdyBhIGNlcnRhaW4KPiA+ID4gPiBuYW1pbmcgc2NoZW1lIChub3cpLiAgUGFyZW50IG5vZGUg
bmFtZSBpcyBub3QgZW5mb3JjZWQsIGJ1dCByZWNvbW1lbmRlZAo+ID4gPiA+IGJ5IERUIHByb2pl
Y3QuCj4gPiA+ID4gCj4gPiA+ID4gICBEVEMgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvaXFzNjJ4LmV4YW1wbGUuZHQueWFtbAo+ID4gPiA+ICAgQ0hFQ0sgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC5leGFtcGxlLmR0LnlhbWwK
PiA+ID4gPiAvaG9tZS9hbGV4L2J1aWxkL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvaXFzNjJ4LmV4YW1wbGUuZHQueWFtbDogcHdtbGVkczogJ3BhbmVsJyBkb2Vz
IG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdebGVkKC1bMC05YS1mXSspPyQnLCAncGlu
Y3RybC1bMC05XSsnCj4gPiA+ID4gICAgICAgICBGcm9tIHNjaGVtYTogL2hvbWUvYWxleC9zcmMv
bGludXgvbGVkcy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLXB3
bS55YW1sCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIERhaGwgPHBv
c3RAbGVzcG9ja3kuZGU+Cj4gPiA+ID4gQWNrZWQtYnk6IEplZmYgTGFCdW5keSA8amVmZkBsYWJ1
bmR5LmNvbT4KPiA+ID4gPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
PiA+ID4gCj4gPiA+IFRoYW5rcywgYXBwbGllZC4KPiA+IAo+ID4gU29ycnksIHdoYXQ/Cj4gPiAK
PiA+IEFwcGxpZWQgdG8gd2hhdCB0cmVlPwo+IAo+IEkgdG9vayBpdCB0byAobG9jYWwgY29weSkg
b2YgbGVkcy1uZXh0IHRyZWUgb24uIEJ1dCBub3cgSSByZWFsaXNlZCBpdAo+IGlzIG1mZCwgbm90
IGEgTEVEIHBhdGNoLCBzbyBJIHVuZG9uZSB0aGF0LiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4K
PiAKPiBBbnl3YXksIHBhdGNoIHN0aWxsIGxvb2tzIGdvb2QgdG8gbWU6Cj4gCj4gQWNrZWQtYnk6
IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6PgoKVGhhbmtzIFBhdmVsLgoKSSBwbGFuIG9uIHRh
a2luZyB0aGlzIG5leHQgd2Vlay4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
