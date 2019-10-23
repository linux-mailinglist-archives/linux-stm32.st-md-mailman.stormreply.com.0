Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72423E1CE0
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2019 15:39:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D581EC36B0B;
	Wed, 23 Oct 2019 13:39:51 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDBDEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:39:50 +0000 (UTC)
Received: from mail-qt1-f181.google.com ([209.85.160.181]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MmU1H-1hfipr0hKT-00iT2a for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 15:39:50 +0200
Received: by mail-qt1-f181.google.com with SMTP id e14so12534587qto.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 06:39:49 -0700 (PDT)
X-Gm-Message-State: APjAAAVMUKLZWVo8t/vDPiWpm6Xrxjd91o25smZCLzk9KtGpbjiBbTcw
 /JexqY/g2RopASf0FAzaYcQYFICtARUb8VzTssU=
X-Google-Smtp-Source: APXvYqyt7m8OnGbGOfKvN6UapNf8Y0PixnD+b/5MFVO15QeK4AzpoE5xCHBxjuJT4OWklHgs4L5FWsrmt4sucJ53v+g=
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr9289234qtk.304.1571837989082; 
 Wed, 23 Oct 2019 06:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191023131049.GG11048@pi3>
In-Reply-To: <20191023131049.GG11048@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Oct 2019 15:39:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1v2-+geD+JbNP-t418ZjntQNSte4rt8c7N6sJdpb3+DQ@mail.gmail.com>
Message-ID: <CAK8P3a1v2-+geD+JbNP-t418ZjntQNSte4rt8c7N6sJdpb3+DQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:IoZMUKU/fh09A9Xe2pSOzyhv32zWUNoR3pH+LW48TxZUiCx4wnr
 SQvJXpbluAPZcN2owvWt1DQCVeI8BqZaI+zXDUtzuoUUJP/mA2ylKl8HSZYSjzqUml4vjtI
 TPg6FdHn1t6J5rNQTuJbUAMY+zAZ41N5lQCXjBUL/yBDCi0LjwkFNWdzC2qNW/HWE20wEMP
 uwhbKa8DIZH/NinaDxkKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y8M7threZBg=:SgZ284H4XznP/aru4LUX01
 wBoqYe2N3M21der2o0apZxFHvrUOBH/JFyczkl7C1RzQ5yX64+t8oQWckHEros+Dk3H+6fJs1
 3HnJNaRbenqkSOOXcvKHZbThPiaaIrEmwyBmT+kaDhwD6l1KzYXf5oAMRKR2UZJY7RYzjtAz3
 Y8HG1KLwHBOSnMbPsuLlho5jXLGoFj7GwmO+T47o+9EG94muPhMwbx7cGBojiGPK/lDqxvHfo
 1ZLX4JnQvuHZf1s0Hzbrq5VNoFK16WS0DDxg8dvVsL1CVyopwt+ZjEXwis/H5JnGDDQzmgmvd
 URlO7NY4EAAzK8ds0PxXZTsAw2+BE7tZ3nl5Hb4gK1dp/FY5A7MJKtlkaLWtXX/zhRiiP8JoO
 8R4zH5prk5gvt+sQ2lcu+xIRy5TAkeeGP0V4ylPHhiC2qpbCI1/1Gycj+1cDNi01PkQS3NRJ5
 HTYekePEVBereiLUpuj7tC324R9g+2mSi5b5/Mtws35fNnSqlKN9eJpnqPkan442F2izauApf
 KC15NBd4ByeBXitPmK6LgvwBR5x4F9j1eyO9vcQu0znHGsdn45EOKro/XxU041So39kCdttRz
 mZqTSzTr0NqUd66ilm1/CR9YC8vk+j1O5DyTLDNnSzNy/1EUFSd5hvvh/QvXWUBqLrDamsPjl
 KH3SiOasgMudZWmcxX+E97qIHMzqgmVV3jij8liZ1hmqs+7Ccje9bjGzj506YdIXmy+L+xc13
 TSUr0NL6dpedjWlLna1U18WXyTlqMJpLyjz6GD7oQewUkO3poRPElr9LFwpJnOXFKXPgeS9nF
 BNmjjQhKaIyTJd3OrS7lJIwbxuCmU7EBy53UWICW31XWnO9OqGSiqy4/j5aBV6KUXYIWpIzt7
 rL5zHmpnHCZbEekEBChQ==
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Lihua Yao <ylhuajnu@outlook.com>, Kukjin Kim <kgene@kernel.org>,
 linux-serial@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Linux PM list <linux-pm@vger.kernel.org>, Lihua Yao <ylhuajnu@163.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, USB list <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/36] ARM: samsung platform cleanup
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

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMzoxMSBQTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDEwOjI4OjAyUE0g
KzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBUaGUgY29udGVudHMgYXJlIGF2YWlsYWJs
ZSBmb3IgdGVzdGluZyBpbgo+ID4KPiA+IGdpdDovL2tlcm5lbC5vcmc6L3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9hcm5kL3BsYXlncm91bmQuZ2l0IHMzYy1tdWx0aXBsYXRmb3JtCj4KPiBXaGVu
IHNlbmRpbmcgdjIsIGNhbiB5b3UgQ2M6Cj4KPiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFq
LmNobWllbEBnbWFpbC5jb20+Cj4gTGlodWEgWWFvIDx5bGh1YWpudUBvdXRsb29rLmNvbT4KPiAo
b3IgTGlodWEgWWFvIDx5bGh1YWpudUAxNjMuY29tPiBpZiBvdXRsb29rLmNvbSBib3VuY2VzKQo+
IFNlcmdpbyBQcmFkbyA8c2VyZ2lvLnByYWRvQGUtbGFid29ya3MuY29tPgo+IFN5bHdlc3RlciBO
YXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KPgo+IFRoZXNlIGFyZSBmb2xrcyB3aGlj
aCB0byBteSBrbm93bGVkZ2UgaGFkIHdvcmtpbmcgUzNDIGFuZCBTNVAgYm9hcmRzCj4gc28gbWF5
YmUgdGhleSBjb3VsZCBwcm92aWRlIHRlc3RpbmcuCgpPaywgd2lsbCBkby4gSSd2ZSB1cGxvYWRl
ZCB0aGUgbW9kaWZpZWQgdmVyc2lvbiBiYXNlZCBvbiB5b3VyIGNvbW1lbnRzIHRvCnRoZSBhYm92
ZSBVUkwgZm9yIG5vdy4KCkknbGwgcHJvYmFibHkgZ2l2ZSBpdCBhIGxpdHRsZSBtb3JlIHRpbWUg
YmVmb3JlIHJlc2VuZGluZywgYnV0IHRoZXkKY291bGQgYWxyZWFkeQpzdGFydCB0ZXN0aW5nIHRo
YXQgdmVyc2lvbi4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIHJldmlldyEKCiAgICAgIEFybmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
