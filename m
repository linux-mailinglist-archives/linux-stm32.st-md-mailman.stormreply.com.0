Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E6E1CBC
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2019 15:36:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93F77C36B0B;
	Wed, 23 Oct 2019 13:36:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0BADC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:36:07 +0000 (UTC)
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MdNHa-1hoD6V0XKa-00ZRvS for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 15:36:07 +0200
Received: by mail-qt1-f182.google.com with SMTP id u22so32225817qtq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 06:36:06 -0700 (PDT)
X-Gm-Message-State: APjAAAXwyNG6LFgoUiZlordspnoOitfIbuC+HiGZzY0q6tsXGLv7OSQb
 oeTYZD+xe7wJfazl6biPdv2X+nBdEfBIfQEQY2A=
X-Google-Smtp-Source: APXvYqwqW5j67aigUtbaQwMvvZPaRM75Zx1vwHK4rpCvIcwvfeEYCvDuZFw2giioKFckU9rb9ypL7pHNYyg0dml8Ps0=
X-Received: by 2002:aed:3c67:: with SMTP id u36mr9047061qte.142.1571837765100; 
 Wed, 23 Oct 2019 06:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-28-arnd@arndb.de> <20191023131321.GH11048@pi3>
In-Reply-To: <20191023131321.GH11048@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Oct 2019 15:35:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a03JtFrCYFUQAFnSENghrXSCDBQXB-QfiDG3yTxXxdpaw@mail.gmail.com>
Message-ID: <CAK8P3a03JtFrCYFUQAFnSENghrXSCDBQXB-QfiDG3yTxXxdpaw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:HYFRww7xk7+MZU9p8u3Ewcoad3SQm4y4+J4ZP+tsY4thXoZ25OU
 o501DtJmf/K5JViah3XH/wbW0m4Al8vqX1eTKdcnkE0f52lOpTk8O90Xc+PzhkUKLrNXwOH
 9gQ7+IEi+xEhk9oz6YS15c6j+4tWPEJZyZrMf8r+XtSRIQaxcpaB1AQrfTQQGydZDGDUiwY
 aX2NTZHax3N3ZMc/ELnqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ptZJ268Js8A=:joeAb2MXhK88kprZP1E6Sg
 QpSK3yRjQhCFhgfVF6BQR8EotyvGuhF29CgnJ+LlHUs2XuYCSc+4P1FK626YmWOoewlbWV6JD
 J6GSz+g8xEyLj+MZUbZmFEQ5ugv9aDET0KQKAZOlgPYujFeNRAgKmv+2DhPxnNvCk3MtyMlmd
 YOOjZjRCip74YTomVwDKrVTExUTgGBoEIB7rhrtO/YukZpKD55mP8Bb7siW+wCtiowIiOQJHx
 koyxkRQvFcw+/s0/6XjdFHi4CuRLYGslZw1N3mVUuOLOMJ0oKzvF/MSWsEUtdm+l38VCwJQCq
 KGRlav/7UJdaZMek8uS6OtR4y/a7ekP5S5wep3iFCLVcZgrSrDaDBmW90lUoIPFuhcsbOLxQj
 vU8glSoUfpFX6F4ByrAh0mMcXbG7bP5K3y6VWCAox7ujYLUiNy16fvQP1/5aMF4d5qEgWKxg8
 XwRihDDtDmCB7JFR08H98qL8s27zApb5QTpwLquF06CVAoobZ2iYXOUnieyx6LdSWAqfdtUlu
 uJscPZrCPwHDfp4y4+uOJUaA0GjlO5rUQtVuN+D6y5ysiJuEfS8aYS1M7DiOjjscQh7rTWaXW
 f/sF64XDmMYBHx45FMDT2eIpOTEBa8gaE9qQgfk0/kJzJxR48B5d4LmtUFfFLiDRlVEfovKwl
 YqRGwWMsoQccFO0WvtQIvwYmX/olB1WV9KpBpwXGvMZFy8iE5evW3G0wfBFKoZzJuEpfQUJ4Q
 2/e1cjCvo+moQI3NH8Bdb+pmvFr85mgwV1P80mwR5sR6Otg6IIHrEVu6ul6M0JEsjKjgkN4uY
 gIURewthI+/vZncZ+ru97j7u0vDfGThqYCUsUfZZzhpXdw8pDkx8DWJm6BcjtKq1lNNWa2xqf
 gzBZCWGYoZG2yqHLOLyQ==
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 28/36] fbdev: s3c2410fb: remove mach
	header dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Oct 23, 2019 at 3:13 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Oct 10, 2019 at 10:30:12PM +0200, Arnd Bergmann wrote:

> > @@ -321,6 +320,7 @@ static struct s3c2410fb_mach_info jive_lcd_config = {
> >        * data. */
> >
> >       .gpcup          = (0xf << 1) | (0x3f << 10),
> > +     .gpcup_reg =    S3C2410_GPCUP,
>
> Nits: indentation before/after '=' looks wrong. Tab should be
> before '=', one space after.

Ok, fixed now for the four boards that had inconsistent indentation --
jive, mini2440, smdk2440, and rx1950. Unfortunately each board
seemed to have its own way of doing this.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
