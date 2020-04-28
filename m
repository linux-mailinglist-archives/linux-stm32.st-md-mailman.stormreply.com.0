Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C31BB72B
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 09:03:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B295DC36B0C;
	Tue, 28 Apr 2020 07:03:32 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0DB5C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 07:03:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i10so23279730wrv.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d80p8k51RV8Ii31H8c+Iq6vujq3CggrPsTKCRimkvi4=;
 b=zXun4602okDGRYn8XiLEIHtsfd9v1rIwMMKeu+9hiWx2ZG/wJd3ht1CLbz/PPWSPzx
 Xs/SGjQnIpi+0oDrczAeaVSDJD57qpno8vVy/PCokt/MlwZ/B3y4NIDOoIlZZd1ES49Z
 SZR34DXDeT6Y1ajYv83ohSDh1wpyPD0aUWMJdHFb5hwV/mJlj9LIXKXU+uYfjkgirS6a
 lHsOEZCEcvEebukq22aTjSB7xg1QO2hTypVt5JWWvi92tMy5J+fnTeNPaiXcv5ltXVj/
 W+y4HIEce1zmyGtpa2sGAHF3x+Pp0HSBBzCvsR1cNLJVP94gnlyKz79YF7IjHUYNSL20
 wS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d80p8k51RV8Ii31H8c+Iq6vujq3CggrPsTKCRimkvi4=;
 b=ZxfOuFveEWGJGuopf9zCB6bTYb56FOCRNyQ7H9xcxtvWJl8Ts7oA44s/WxuhIHv2JD
 4hOMW8Rx1M9n4k2pSwvUSGl65jj7Cm+rcbrUU6Z7kec9omaOEV5nYQYtLkaW9NgyPPFF
 aZJKA3wBbMU1PBVdUBPrVUDJFzofjZjc+bEcgRmOBxlX1F4aBFlSleXATCVb1D3oq9Zu
 jmvUI+SusENxtLLHa/iL3d6elMa7fRyesxlHmY3NfJcR5T0yRgnozfXvbXbg2vArRo0F
 E8ddbRxZ692J/ace8VtUnkXz+KJsf4mPJkB/P/JVJV8CqAlHcClafuYN9GyXsCN0ieI4
 +0gQ==
X-Gm-Message-State: AGi0PuYIJswO9iuyBz0/PZV45xCselpWK+MvBz6oEQMhMd3gTaiGD2FM
 iixQgM1I08gUDivwfXAGC5HHmA==
X-Google-Smtp-Source: APiQypJcL3tHBCbLlcc7UeQUAGJ2UgtgMo77ETUj1h5CMVB6neW1tCihGzh0jeWgP3NKFnYTOQn4wA==
X-Received: by 2002:adf:f98e:: with SMTP id f14mr31210015wrr.253.1588057409075; 
 Tue, 28 Apr 2020 00:03:29 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id m8sm25497629wrx.54.2020.04.28.00.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 00:03:28 -0700 (PDT)
Date: Tue, 28 Apr 2020 08:03:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Adrian Pop <pop.adrian61@gmail.com>
Message-ID: <20200428070326.GH3559@dell>
References: <20200424181642.32084-1-pop.adrian61@gmail.com>
 <20200427064910.GC3559@dell>
 <CAP-HsdQOyWrz+Y7gR9jrNjX09NCYB1EWK7swMQDZ-v-VJLGRMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-HsdQOyWrz+Y7gR9jrNjX09NCYB1EWK7swMQDZ-v-VJLGRMw@mail.gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] arm: dt-bindings: mfd: stm32f-rcc:
 Add missing DSI clock
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

T24gTW9uLCAyNyBBcHIgMjAyMCwgQWRyaWFuIFBvcCB3cm90ZToKCj4gT24gTW9uLCBBcHIgMjcs
IDIwMjAgYXQgOTo0OSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToK
PiA+Cj4gPiBPbiBGcmksIDI0IEFwciAyMDIwLCBBZHJpYW4gUG9wIHdyb3RlOgo+ID4KPiA+ID4g
QWRkIG1pc3NpbmcgY2xvY2suCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQb3Ag
PHBvcC5hZHJpYW42MUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgaW5jbHVkZS9kdC1iaW5k
aW5ncy9tZmQvc3RtMzJmNy1yY2MuaCB8IDEgKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gPgo+ID4gSSBhc3N1bWUgcGF0Y2ggMiBkZXBlbmRzIG9uIHRoaXM/Cj4gCj4g
WWVzLCBzZWNvbmQgcGF0Y2ggZGVwZW5kcyBvbiB0aGlzLgo+IAo+ID4KPiA+IElmIHNvLCB3aGVy
ZSBpcyBpdD8gIFdoeSBpc24ndCBpdCBpbiBteSBpbmJveD8KPiA+Cj4gCj4gSGVyZSBpdCBpczoK
PiAKPiBTVE0zMmY3NjktZGlzY28gZmVhdHVyZXMgYSA0IiBNSVBJIERTSSBkaXNwbGF5OiBhZGQg
c3VwcG9ydCBmb3IgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8cG9wLmFkcmlh
bjYxQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNzQ2LmR0c2kg
ICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY3
NjktZGlzY28uZHRzIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKQoKV2hlbiB5b3UgcmVzdWJtaXQgdGhpcywgcGxlYXNl
IGFkZCBhbGwgcmVjaXBpZW50cyB0byBhbGwgcGF0Y2hlcy4KCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
