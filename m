Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81EAC6B74
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 16:12:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6C6EC36B35;
	Wed, 28 May 2025 14:12:14 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B71C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 14:12:14 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-32a72e61a3fso11260191fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 07:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748441528; x=1749046328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ksdw7M5oeACHV4O06/7f6T9AIjZYxql+qwEMoPd8Euo=;
 b=QqKz/cIQXFjg+bRO5safW4uay5zy2bM+DnesL+YakwVF7C2xG7Uqdttxds2cKBdgKF
 mWDgxYxvSXXa/NiyTJ+4XTgzNsEEVae+G6DVXK+gUXgFBUSYEsFNigpCyfauurVpDBGT
 HWjkuuWijZP3w8cy/Mkg9rve8GpziIUauWYD1lhy9YE+b9rqj0sXMUI3a+yJGNYHpjO/
 QZBeOCZyUQq96KL+luaoob1S/f2J27daDA7YZIu/D/cJsBuGC+8XsYSvDLZiWlio7WV/
 ia/4RWAXoYf1H/8NcU2cvv1TC08yHJ9NsjeWFyzxwfo+qKR25lekuamWNP5tdkiuXlEG
 6GJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsxtvyEbDk0r4hz9FWn+AQs7lOgpOaMldPAmioI+vegWvqCdqck1n3+4gd0N191ap7sZ9faR0hdatCLg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzoSM+t6tpCw/vApTa7C4OfHan++ZwQWl6HnV71LVh/rgHeUIFP
 +SIHYQ7iizdOU9+SaGQO7j2ioJQFmhe8EMprd3EQYAhxEIm7kmjRzaITyiqiVBhQ
X-Gm-Gg: ASbGncuYBU0c7e0j4009OYH6YuhxuXvPNreq+/jltGFAzRg0OLay9nxsP0BRkysDIwq
 XkU98rdPDghPDJIKq3Ke+a560d+rY5KJFaBwc9ufTJN4q67vpOQVl3loWkaitI4T/4pBzlPf2Si
 YwyUDHdiR5rqMpxtfrOmmp3YzohH5PuNmk3nrwz7yn8MlY10jGhwX7Ta/gdAAUFBd5/58ICZbqS
 27n3oXoTuPvPZlGIgMgd+R4gPpVKt1tobJlovIRSxSyP0Y5rxIlBCRSyk/symbH9d2qcLjLYCEN
 g8pamfvYfqiEv07YbrwXEx22JQ46Ev9RVt6vdkl6rSq1Q88hDlPYojPPHA2mtuyamoSSNSXZMdd
 GBRBNLjjW
X-Google-Smtp-Source: AGHT+IGU2J1P3XQoNVJa+nE96o/Wdsehlkh4E1jTSqUSTY8gVclMSJC9MBodwJq92ZjO9f7AOIZ8vQ==
X-Received: by 2002:a05:6512:3d24:b0:553:268e:5011 with SMTP id
 2adb3069b0e04-5532ce33603mr1550300e87.26.1748441528141; 
 Wed, 28 May 2025 07:12:08 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f6a5f35sm299771e87.165.2025.05.28.07.12.05
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 07:12:06 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-32a72e61a3fso11258341fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 07:12:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXDtVlxlIv8LMuClv8Om51ik9GtzJNS33ulPvOCqbxxi8ACXIwbH2R+9H792hXVXiu7tVONV1SYT1RjZw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:651c:418e:b0:326:cf84:63c4 with SMTP id
 38308e7fff4ca-32a736a7554mr15406341fa.1.1748441525068; Wed, 28 May 2025
 07:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
 <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
In-Reply-To: <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 28 May 2025 22:11:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
X-Gm-Features: AX0GCFvkvTc-VRmYOaYU5xGuR2czReptL7cuDFoxwx0sxNWmjpy1lDF4i_MRIR8
Message-ID: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgOToyNeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyOCwgMjAyNSBhdCAwNTo1NzozOEFNIC0wNjAw
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDE6NTPi
gK9BTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkKPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAwMjozNzowM1BNIC0wNjAw
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAy
OjMw4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IFN1cmUsIHRoYXQgbWF5IG1ha2Ugc2Vuc2UgdG8gZG8gYXMgd2VsbCwgYnV0IEkg
c3RpbGwgZG9uJ3Qgc2VlCj4gPiA+ID4gPiA+IGhvdyB0aGF0IGltcGFjdHMgdGhlIG5lZWQgdG8g
cnVudGltZSBzZWxlY3QgdGhlIFBIWSB3aGljaAo+ID4gPiA+ID4gPiBpcyBjb25maWd1cmVkIGZv
ciB0aGUgY29ycmVjdCBNRkQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSWYgeW91IGtub3cgd2hhdCB2
YXJpYW50IHlvdSBoYXZlLCB5b3Ugb25seSBpbmNsdWRlIHRoZSBvbmUgUEhZIHlvdQo+ID4gPiA+
ID4gYWN0dWFsbHkgaGF2ZSwgYW5kIHBoeS1oYW5kbGUgcG9pbnRzIHRvIGl0LCBqdXN0IGFzIG5v
cm1hbC4gTm8gcnVudGltZQo+ID4gPiA+ID4gc2VsZWN0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gT2gs
IHNvIGhlcmUncyB0aGUgaXNzdWUsIHdlIGhhdmUgYm90aCBQSFkgdmFyaWFudHMsIG9sZGVyIGhh
cmR3YXJlCj4gPiA+ID4gZ2VuZXJhbGx5IGhhcyBBQzIwMCBQSFkncyB3aGlsZSBuZXdlciBzaGlw
cyBBQzMwMCBQSFkncywgYnV0Cj4gPiA+ID4gd2hlbiBJIHN1cnZleWVkIG91ciBkZXBsb3llZCBo
YXJkd2FyZSB1c2luZyB0aGVzZSBib2FyZHMgbWFueQo+ID4gPiA+IHN5c3RlbXMgb2Ygc2ltaWxh
ciBhZ2Ugd291bGQgcmFuZG9tbHkgbWl4IEFDMjAwIGFuZCBBQzMwMCBQSFkncy4KPiA+ID4gPgo+
ID4gPiA+IEl0IGFwcGVhcnMgdGhlcmUgd2FzIGEgZmFpcmx5IGxvbmcgdHJhbnNpdGlvbiBwZXJp
b2Qgd2hlcmUgYm90aCB2YXJpYW50cwo+ID4gPiA+IHdlcmUgYmVpbmcgc2hpcHBlZC4KPiA+ID4K
PiA+ID4gR2l2ZW4gdGhhdCBEVCBpcyBzdXBwb3NlZCB0byBkZXNjcmliZSB0aGUgaGFyZHdhcmUg
dGhhdCBpcyBiZWluZyBydW4gb24sCj4gPiA+IGl0IHNob3VsZCBfZGVzY3JpYmVfIF90aGVfIF9o
YXJkd2FyZV8gdGhhdCB0aGUga2VybmVsIGlzIGJlaW5nIHJ1biBvbi4KPiA+ID4KPiA+ID4gVGhh
dCBtZWFucyBub3QgZW51bWVyYXRpbmcgYWxsIHBvc3NpYmlsaXRpZXMgaW4gRFQgYW5kIHRoZW4g
aGF2aW5nIG1hZ2ljCj4gPiA+IGluIHRoZSBrZXJuZWwgdG8gc2VsZWN0IHRoZSByaWdodCB2YXJp
YW50LiBUaGF0IG1lYW5zIGhhdmluZyBhIGNvcnJlY3QKPiA+ID4gZGVzY3JpcHRpb24gaW4gRFQg
Zm9yIHRoZSBrZXJuZWwgdG8gdXNlLgo+ID4KPiA+IFRoZSBhcHByb2FjaCBJJ20gdXNpbmcgaXMg
SU1PIHF1aXRlIHNpbWlsYXIgdG8gc2F5IG90aGVyIGhhcmR3YXJlCj4gPiB2YXJpYW50IHJ1bnRp
bWUgZGV0ZWN0aW9uIERUIGZlYXR1cmVzIGxpa2UgdGhpczoKPiA+IGh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9jb21taXQvMTU3Y2U4ZjM4MWVmZTI2NDkzM2U5MzY2ZGI4MjhkODQ1
YmFkZTNhMQo+Cj4gVGhhdCBpcyBmb3IgdGhpbmdzIGxpbmsgYSBIQVQgb24gYSBSUGkuIEl0IGlz
IHNvbWV0aGluZyB3aGljaCBpcyBlYXN5Cj4gdG8gcmVwbGFjZSwgYW5kIGlzIGV4cGVjdGVkIHRv
IGJlIHJlcGxhY2VkLgoKQWN0dWFsbHkgaXQncyBmb3Igc2Vjb25kIHNvdXJjZWQgY29tcG9uZW50
cyB0aGF0IGFyZSBtb2R1bGVzIF93aXRoaW5fCnRoZSBkZXZpY2UgKGEgdGFibGV0IG9yIGEgbGFw
dG9wKSB0aGF0IGdldCBzd2FwcGVkIGluIGF0IHRoZSBmYWN0b3J5LgpEZWZpbml0ZWx5IG5vdCBz
b21ldGhpbmcgZWFzeSB0byByZXBsYWNlIGFuZCBub3QgZXhwZWN0ZWQgdG8gYmUgcmVwbGFjZWQK
YnkgdGhlIGVuZCB1c2VyLgoKVGhlIG90aGVyIHRoaW5nIGlzIHRoYXQgdGhlcmUgYXJlIG5vIGRp
c3Rpbmd1aXNoaW5nIGlkZW50aWZpZXJzIGZvciBhCmRldmljZSB0cmVlIG1hdGNoIGZvciB0aGUg
c3dhcC1pbiB2YXJpYW50cyBhdCB0aGUgYm9hcmQgLyBkZXZpY2UgbGV2ZWwuClRob3VnaCBJIGRv
IGhhdmUgc29tZXRoaW5nIHRoYXQgZG9lcyBEVCBmaXh1cHMgaW4gdGhlIGtlcm5lbCBmb3IgSURz
CnBhc3NlZCBvdmVyIGJ5IHRoZSBmaXJtd2FyZS4gVGhlcmUgYXJlIG90aGVyIHJlYXNvbnMgZm9y
IHRoaXMgYXJyYW5nZW1lbnQsCm9uZSBiZWluZyB0aGF0IHRoZSBmaXJtd2FyZSBpcyBub3QgZWFz
aWx5IHVwZ3JhZGFibGUuCgpDaGVuWXUKCj4gWW91IGFyZSB0YWxraW5nIGFib3V0IHNvbWUgZm9y
bSBvZiBjaGlwbGV0IGxpa2UgY29tcG9uZW50IHdpdGhpbiB0aGUKPiBTb0MgcGFja2FnZS4gSXQg
aXMgbm90IGVhc3kgdG8gcmVwbGFjZSwgYW5kIG5vdCBleHBlY3RlZCB0byBiZQo+IHJlcGxhY2Vk
Lgo+Cj4gRGlmZmVyZW50IHVzZXMgY2FzZXMgYWx0b2dldGhlci4KPgo+IFdoYXQgaSB0aGluayB3
ZSB3aWxsIGVuZCB1cCB3aXRoIGlzIHRoZSBiYXNlIFNvQyAuZHRzaSBmaWxlLCBhbmQgdHdvCj4g
YWRkaXRpb25hbCAuZHRzaSBmaWxlcyBkZXNjcmliaW5nIHRoZSB0d28gUEhZIHZhcmlhbnRzLgo+
Cj4gICAgICAgICBBbmRyZXcKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
