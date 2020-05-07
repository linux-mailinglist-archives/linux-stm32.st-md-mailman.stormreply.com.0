Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3791C8AB5
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 14:27:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88A7FC3F943;
	Thu,  7 May 2020 12:27:59 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7631DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 12:27:58 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id c16so1021004ilr.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 05:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fLbod5oBB5PY8xElErLfRg7s/k5grob/buHGrez/hNo=;
 b=gb+OXswq9g+QuAQr84d/qJ2T1E/Cgk5NkPB1x7C/z9SFApQ8DxYNPPJZRTxDnPN+Zn
 3Tt9uTswkVQJVt44rBi9ovgLD3qEyL/6euVDqjEtaJwEd0iRLNTLZzxuYa/5zFEmXfji
 7k6QIhZ3uQV40oAthfLr1cLgKP4qYMKScsqvc/KCmIG2gn4AHIDSq/Xi8YE1/jYY4pKc
 EZKMQmFF4LFiEmMEPlYCF11RdwTv18D2gNgVIhtCjGPNvSUnVxkig0HTlEhuJpWJhk/+
 Cvx/qTSnIxQ3LGBxtnTK63E4hmLT5e1bVTkvGMEkEaa7IKkH1u84DWdI6aKkJKTAyLDI
 O5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fLbod5oBB5PY8xElErLfRg7s/k5grob/buHGrez/hNo=;
 b=eGqEmVbwEW2bA6GoqzmnfMtHWYaSC/hDVr5K4LPLCt9CBfDyfuBva01rtInZIWUr7V
 olt6b/0tsQ9y4/fenZuC22jLslSCov3TjsOVqks2KchdZ+UzxrdLQ7uD3LGZ4dTFsmIF
 vFZNghUOEfCcdAQm0F9+zta9BsC8A3t0YQBseLGuDlIUZYJF0pwR9lQqMUQCMw6LD+dk
 YqWCebT03pOTArVq5aWJLZpdHz0SoVtSNdRcEQzkJfjdphk4wVUr/2ViVYWumoI/aDsj
 D4NwVaukKx5SAijHXz5G/7p3JQnv8WwldbEMkR82kx3hDGPAQOL2EUI8Ufd+hF0DILJq
 3rZQ==
X-Gm-Message-State: AGi0PuYXyAPraN5K8rI2ZhJ/zxwtmlgosGS7E+/dtu9p2vF6NxxeWGDV
 VB8zY0ir7kKIlWmaw4lWCCxdasOiszDxsT5icug=
X-Google-Smtp-Source: APiQypKULbkSE6nOwIwETIoNRL//x0Cgs12dI0oHoL2qfgQYKZZvEevWYCGSVEOPm8CHqn6xFI3ntUe/kebuZ4CNARU=
X-Received: by 2002:a92:8cdd:: with SMTP id s90mr14638631ill.200.1588854477228; 
 Thu, 07 May 2020 05:27:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:8401:0:0:0:0:0 with HTTP;
 Thu, 7 May 2020 05:27:56 -0700 (PDT)
In-Reply-To: <bf42a03d-0719-b4c9-7153-818e26dae888@st.com>
References: <1588850125-24344-1-git-send-email-dillon.minfei@gmail.com>
 <98d6d44c-ff23-ac15-c17b-8f5f49ad2274@st.com>
 <CAPTRvHns7WZj49O2MKHN-ByJpHjYftCqakHN_XOzTwMkg57z0Q@mail.gmail.com>
 <bf42a03d-0719-b4c9-7153-818e26dae888@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 7 May 2020 20:27:56 +0800
Message-ID: <CAL9mu0+w9UVa9qU=01zi6YHCRhq-BdbL9-ZVBLdVfxVcviQ_fQ@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Hua Dillon <dillonhua@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "philippe.schenker@toradex.com" <philippe.schenker@toradex.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 3/4] ARM: dts: stm32: enable stmpe811
	on stm32429-disco board
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
Content-Type: multipart/mixed; boundary="===============3455642634227726795=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3455642634227726795==
Content-Type: multipart/alternative; boundary="000000000000b712e105a50e0222"

--000000000000b712e105a50e0222
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2020=E5=B9=B45=E6=9C=887=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B=EF=
=BC=8CAlexandre Torgue <alexandre.torgue@st.com> =E5=86=99=E9=81=93=EF=BC=
=9A

>
>
> On 5/7/20 2:13 PM, Hua Dillon wrote:
>
>> hi, alexandre torgue
>>
>> so, if i add "---" below
>>   Signed-off-by: dillon min <dillon.minfei@gmail.com <mailto:
>> dillon.minfei@gmail.com>>
>>   in git commit process, with changes log after that.  the log will not
>> show in commit messages, but will exist in git patchs, just showing for
>> reviewers ?
>>
>
> Sorry I was not enough clear. Add --- after your signed-off and add your
> log change after
>
> ok, i will check others git commit messages first, then try it tomorrow.
thanks

>
>> i will try this tomorrow, resubmit it.
>>
>> thanks for your help.
>>
>> best regards
>>
>> dillon
>>
>> =E5=9C=A8 2020=E5=B9=B45=E6=9C=887=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B=
=EF=BC=8CAlexandre Torgue <alexandre.torgue@st.com <mailto:
>> alexandre.torgue@st.com>> =E5=86=99=E9=81=93=EF=BC=9A
>>
>>     Hi Dillon
>>
>>     On 5/7/20 1:15 PM, dillon.minfei@gmail.com
>>     <mailto:dillon.minfei@gmail.com> wrote:
>>
>>         From: dillon min <dillon.minfei@gmail.com
>>         <mailto:dillon.minfei@gmail.com>>
>>
>>         Enable the stmpe811 touch screen on stm32429-disco board.
>>
>>         Signed-off-by: dillon min <dillon.minfei@gmail.com
>>         <mailto:dillon.minfei@gmail.com>>
>>
>>         [PATCH 3/4]: ARM: dts: stm32: enable stmpe811 on stm32429-disco
>>
>>         V2:
>>         patch 3: remove unused id, blocks, irq-trigger
>>
>>         V1:
>>         patch 4: fix read touch screen xyz timeout bug
>>         patch 3: enable stmpe_touchscreen on stm32f429-disco board
>>         patch 2: add i2c3 pin mux for stm32f4
>>         patch 1: add i2c3 controller interface for stm32f4
>>
>>
>>     Good idea to add changes log for this patch. But this log has to be
>>     placed  after "---" below. This log has not to appear in your commit
>>     message. Furthermore, you should only add changes for this patch
>>     without talking about other patches .
>>
>>
>>         Signed-off-by: dillon min <dillon.minfei@gmail.com
>>         <mailto:dillon.minfei@gmail.com>>
>>         ---
>>
>>
>>     Add patch change log here.
>>
>>            arch/arm/boot/dts/stm32f429-disco.dts | 47
>>         +++++++++++++++++++++++++++++++++++
>>            1 file changed, 47 insertions(+)
>>
>>         diff --git a/arch/arm/boot/dts/stm32f429-disco.dts
>>         b/arch/arm/boot/dts/stm32f429-disco.dts
>>         index 30c0f67..fad1ec1 100644
>>         --- a/arch/arm/boot/dts/stm32f429-disco.dts
>>         +++ b/arch/arm/boot/dts/stm32f429-disco.dts
>>         @@ -49,6 +49,8 @@
>>            #include "stm32f429.dtsi"
>>            #include "stm32f429-pinctrl.dtsi"
>>            #include <dt-bindings/input/input.h>
>>         +#include <dt-bindings/interrupt-controller/irq.h>
>>         +#include <dt-bindings/gpio/gpio.h>
>>              / {
>>                  model =3D "STMicroelectronics STM32F429i-DISCO board";
>>         @@ -127,3 +129,48 @@
>>                  pinctrl-names =3D "default";
>>                  status =3D "okay";
>>            };
>>         +
>>         +&i2c3 {
>>         +       pinctrl-names =3D "default";
>>         +       pinctrl-0 =3D <&i2c3_pins>;
>>         +       clock-frequency =3D <100000>;
>>         +       status =3D "okay";
>>         +
>>         +       stmpe811@41 {
>>         +               compatible =3D "st,stmpe811";
>>         +               reg =3D <0x41>;
>>         +               interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
>>         +               interrupt-parent =3D <&gpioa>;
>>         +               /* 3.25 MHz ADC clock speed */
>>         +               st,adc-freq =3D <1>;
>>         +               /* 12-bit ADC */
>>         +               st,mod-12b =3D <1>;
>>         +               /* internal ADC reference */
>>         +               st,ref-sel =3D <0>;
>>         +               /* ADC converstion time: 80 clocks */
>>         +               st,sample-time =3D <4>;
>>         +
>>         +               stmpe_touchscreen {
>>         +                       compatible =3D "st,stmpe-ts";
>>         +                       /* 8 sample average control */
>>         +                       st,ave-ctrl =3D <3>;
>>         +                       /* 7 length fractional part in z */
>>         +                       st,fraction-z =3D <7>;
>>         +                       /*
>>         +                        * 50 mA typical 80 mA max touchscreen
>>         drivers
>>         +                        * current limit value
>>         +                        */
>>         +                       st,i-drive =3D <1>;
>>         +                       /* 1 ms panel driver settling time */
>>         +                       st,settling =3D <3>;
>>         +                       /* 5 ms touch detect interrupt delay */
>>         +                       st,touch-det-delay =3D <5>;
>>         +               };
>>         +
>>         +               stmpe_adc {
>>         +                       compatible =3D "st,stmpe-adc";
>>         +                       /* forbid to use ADC channels 3-0 (touch=
)
>> */
>>         +                       st,norequest-mask =3D <0x0F>;
>>         +               };
>>         +       };
>>         +};
>>
>>
>>     _______________________________________________
>>     linux-arm-kernel mailing list
>>     linux-arm-kernel@lists.infradead.org
>>     <mailto:linux-arm-kernel@lists.infradead.org>
>>     http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>     <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>
>>
>>

--000000000000b712e105a50e0222
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGJyPjxicj7lnKggMjAyMOW5tDXmnIg35pel5pif5pyf5Zub77yMQWxleGFuZHJlIFRvcmd1ZSAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmFsZXhhbmRyZS50b3JndWVAc3QuY29tIj5hbGV4YW5kcmUudG9y
Z3VlQHN0LmNvbTwvYT4mZ3Q7IOWGmemBk++8mjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xp
ZDtwYWRkaW5nLWxlZnQ6MWV4Ij48YnI+DQo8YnI+DQpPbiA1LzcvMjAgMjoxMyBQTSwgSHVhIERp
bGxvbiB3cm90ZTo8YnI+DQo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6
MWV4Ij4NCmhpLCBhbGV4YW5kcmUgdG9yZ3VlPGJyPg0KPGJyPg0Kc28sIGlmIGkgYWRkICZxdW90
Oy0tLSZxdW90OyBiZWxvdzxicj4NCsKgwqBTaWduZWQtb2ZmLWJ5OiBkaWxsb24gbWluICZsdDs8
YSBocmVmPSJtYWlsdG86ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5k
aWxsb24ubWluZmVpQGdtYWlsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86ZGls
bG9uLm1pbmZlaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5kaWxsb24ubWluZmVpQGdtYWls
LmNvPHdicj5tPC9hPiZndDsmZ3Q7PGJyPg0KwqDCoGluIGdpdCBjb21taXQgcHJvY2Vzcywgd2l0
aCBjaGFuZ2VzIGxvZyBhZnRlciB0aGF0LsKgIHRoZSBsb2cgd2lsbCBub3Qgc2hvdyBpbiBjb21t
aXQgbWVzc2FnZXMsIGJ1dCB3aWxsIGV4aXN0IGluIGdpdCBwYXRjaHMsIGp1c3Qgc2hvd2luZyBm
b3IgcmV2aWV3ZXJzID88YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQpTb3JyeSBJIHdhcyBub3Qg
ZW5vdWdoIGNsZWFyLiBBZGQgLS0tIGFmdGVyIHlvdXIgc2lnbmVkLW9mZiBhbmQgYWRkIHlvdXIg
bG9nIGNoYW5nZSBhZnRlcjxicj4NCjxicj48L2Jsb2NrcXVvdGU+PGRpdj5vaywgaSB3aWxsIGNo
ZWNrIG90aGVycyBnaXQgY29tbWl0IG1lc3NhZ2VzIGZpcnN0LCB0aGVuIHRyeSBpdCB0b21vcnJv
dy48L2Rpdj48ZGl2PnRoYW5rc8KgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFk
ZGluZy1sZWZ0OjFleCI+DQo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6
MWV4Ij4NCjxicj4NCmkgd2lsbCB0cnkgdGhpcyB0b21vcnJvdywgcmVzdWJtaXQgaXQuPGJyPg0K
PGJyPg0KdGhhbmtzIGZvciB5b3VyIGhlbHAuPGJyPg0KPGJyPg0KYmVzdCByZWdhcmRzPGJyPg0K
PGJyPg0KZGlsbG9uPGJyPg0KPGJyPg0K5ZyoIDIwMjDlubQ15pyIN+aXpeaYn+acn+Wbm++8jEFs
ZXhhbmRyZSBUb3JndWUgJmx0OzxhIGhyZWY9Im1haWx0bzphbGV4YW5kcmUudG9yZ3VlQHN0LmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmFsZXhhbmRyZS50b3JndWVAc3QuY29tPC9hPiAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzphbGV4YW5kcmUudG9yZ3VlQHN0LmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmFsZXhhbmRyZS50b3JndWVAc3QuY288d2JyPm08L2E+Jmd0OyZndDsg5YaZ6YGT77yaPGJyPg0K
PGJyPg0KwqAgwqAgSGkgRGlsbG9uPGJyPg0KPGJyPg0KwqAgwqAgT24gNS83LzIwIDE6MTUgUE0s
IDxhIGhyZWY9Im1haWx0bzpkaWxsb24ubWluZmVpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PmRpbGxvbi5taW5mZWlAZ21haWwuY29tPC9hPjxicj4NCsKgIMKgICZsdDttYWlsdG86PGEgaHJl
Zj0ibWFpbHRvOmRpbGxvbi5taW5mZWlAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZGlsbG9u
Lm1pbmZlaUBnbWFpbC5jbzx3YnI+bTwvYT4mZ3Q7IHdyb3RlOjxicj4NCjxicj4NCsKgIMKgIMKg
IMKgIEZyb206IGRpbGxvbiBtaW4gJmx0OzxhIGhyZWY9Im1haWx0bzpkaWxsb24ubWluZmVpQGdt
YWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmRpbGxvbi5taW5mZWlAZ21haWwuY29tPC9hPjxicj4N
CsKgIMKgIMKgIMKgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmRpbGxvbi5taW5mZWlAZ21h
aWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZGlsbG9uLm1pbmZlaUBnbWFpbC5jbzx3YnI+bTwvYT4m
Z3Q7Jmd0Ozxicj4NCjxicj4NCsKgIMKgIMKgIMKgIEVuYWJsZSB0aGUgc3RtcGU4MTEgdG91Y2gg
c2NyZWVuIG9uIHN0bTMyNDI5LWRpc2NvIGJvYXJkLjxicj4NCjxicj4NCsKgIMKgIMKgIMKgIFNp
Z25lZC1vZmYtYnk6IGRpbGxvbiBtaW4gJmx0OzxhIGhyZWY9Im1haWx0bzpkaWxsb24ubWluZmVp
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmRpbGxvbi5taW5mZWlAZ21haWwuY29tPC9hPjxi
cj4NCsKgIMKgIMKgIMKgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmRpbGxvbi5taW5mZWlA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZGlsbG9uLm1pbmZlaUBnbWFpbC5jbzx3YnI+bTwv
YT4mZ3Q7Jmd0Ozxicj4NCjxicj4NCsKgIMKgIMKgIMKgIFtQQVRDSCAzLzRdOiBBUk06IGR0czog
c3RtMzI6IGVuYWJsZSBzdG1wZTgxMSBvbiBzdG0zMjQyOS1kaXNjbzxicj4NCjxicj4NCsKgIMKg
IMKgIMKgIFYyOjxicj4NCsKgIMKgIMKgIMKgIHBhdGNoIDM6IHJlbW92ZSB1bnVzZWQgaWQsIGJs
b2NrcywgaXJxLXRyaWdnZXI8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBWMTo8YnI+DQrCoCDCoCDC
oCDCoCBwYXRjaCA0OiBmaXggcmVhZCB0b3VjaCBzY3JlZW4geHl6IHRpbWVvdXQgYnVnPGJyPg0K
wqAgwqAgwqAgwqAgcGF0Y2ggMzogZW5hYmxlIHN0bXBlX3RvdWNoc2NyZWVuIG9uIHN0bTMyZjQy
OS1kaXNjbyBib2FyZDxicj4NCsKgIMKgIMKgIMKgIHBhdGNoIDI6IGFkZCBpMmMzIHBpbiBtdXgg
Zm9yIHN0bTMyZjQ8YnI+DQrCoCDCoCDCoCDCoCBwYXRjaCAxOiBhZGQgaTJjMyBjb250cm9sbGVy
IGludGVyZmFjZSBmb3Igc3RtMzJmNDxicj4NCjxicj4NCjxicj4NCsKgIMKgIEdvb2QgaWRlYSB0
byBhZGQgY2hhbmdlcyBsb2cgZm9yIHRoaXMgcGF0Y2guIEJ1dCB0aGlzIGxvZyBoYXMgdG8gYmU8
YnI+DQrCoCDCoCBwbGFjZWTCoCBhZnRlciAmcXVvdDstLS0mcXVvdDsgYmVsb3cuIFRoaXMgbG9n
IGhhcyBub3QgdG8gYXBwZWFyIGluIHlvdXIgY29tbWl0PGJyPg0KwqAgwqAgbWVzc2FnZS4gRnVy
dGhlcm1vcmUsIHlvdSBzaG91bGQgb25seSBhZGQgY2hhbmdlcyBmb3IgdGhpcyBwYXRjaDxicj4N
CsKgIMKgIHdpdGhvdXQgdGFsa2luZyBhYm91dCBvdGhlciBwYXRjaGVzIC48YnI+DQo8YnI+DQo8
YnI+DQrCoCDCoCDCoCDCoCBTaWduZWQtb2ZmLWJ5OiBkaWxsb24gbWluICZsdDs8YSBocmVmPSJt
YWlsdG86ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5kaWxsb24ubWlu
ZmVpQGdtYWlsLmNvbTwvYT48YnI+DQrCoCDCoCDCoCDCoCAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpkaWxsb24ubWluZmVpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmRpbGxvbi5taW5m
ZWlAZ21haWwuY288d2JyPm08L2E+Jmd0OyZndDs8YnI+DQrCoCDCoCDCoCDCoCAtLS08YnI+DQo8
YnI+DQo8YnI+DQrCoCDCoCBBZGQgcGF0Y2ggY2hhbmdlIGxvZyBoZXJlLjxicj4NCjxicj4NCsKg
IMKgIMKgIMKgIMKgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LWRpPHdicj5zY28uZHRz
IHwgNDc8YnI+DQrCoCDCoCDCoCDCoCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKys8d2Jy
PisrKysrPGJyPg0KwqAgwqAgwqAgwqAgwqDCoCAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9u
cygrKTxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9zdG0zMmY0MjktPHdicj5kaXNjby5kdHM8YnI+DQrCoCDCoCDCoCDCoCBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMyZjQyOS08d2JyPmRpc2NvLmR0czxicj4NCsKgIMKgIMKgIMKgIGluZGV4IDMw
YzBmNjcuLmZhZDFlYzEgMTAwNjQ0PGJyPg0KwqAgwqAgwqAgwqAgLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvc3RtMzJmNDI5LTx3YnI+ZGlzY28uZHRzPGJyPg0KwqAgwqAgwqAgwqAgKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LTx3YnI+ZGlzY28uZHRzPGJyPg0KwqAgwqAgwqAgwqAg
QEAgLTQ5LDYgKzQ5LDggQEA8YnI+DQrCoCDCoCDCoCDCoCDCoMKgICNpbmNsdWRlICZxdW90O3N0
bTMyZjQyOS5kdHNpJnF1b3Q7PGJyPg0KwqAgwqAgwqAgwqAgwqDCoCAjaW5jbHVkZSAmcXVvdDtz
dG0zMmY0MjktcGluY3RybC5kdHNpJnF1b3Q7PGJyPg0KwqAgwqAgwqAgwqAgwqDCoCAjaW5jbHVk
ZSAmbHQ7ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQuaCZndDs8YnI+DQrCoCDCoCDCoCDCoCArI2lu
Y2x1ZGUgJmx0O2R0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sPHdicj5sZXIvaXJxLmgmZ3Q7
PGJyPg0KwqAgwqAgwqAgwqAgKyNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaCZn
dDs8YnI+DQrCoCDCoCDCoCDCoCDCoMKgIMKgIC8gezxicj4NCsKgIMKgIMKgIMKgIMKgwqAgwqAg
wqAgwqAgbW9kZWwgPSAmcXVvdDtTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJGNDI5aS1ESVNDTyBi
b2FyZCZxdW90Ozs8YnI+DQrCoCDCoCDCoCDCoCBAQCAtMTI3LDMgKzEyOSw0OCBAQDxicj4NCsKg
IMKgIMKgIMKgIMKgwqAgwqAgwqAgwqAgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVv
dDs7PGJyPg0KwqAgwqAgwqAgwqAgwqDCoCDCoCDCoCDCoCBzdGF0dXMgPSAmcXVvdDtva2F5JnF1
b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgwqAgfTs8YnI+DQrCoCDCoCDCoCDCoCArPGJyPg0KwqAg
wqAgwqAgwqAgKyZhbXA7aTJjMyB7PGJyPg0KwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgcGluY3Ry
bC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KwqAgwqAgwqAgwqAgK8KgIMKgIMKg
IMKgcGluY3RybC0wID0gJmx0OyZhbXA7aTJjM19waW5zJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCAr
wqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQrCoCDCoCDC
oCDCoCArwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCsKgIMKgIMKg
IMKgICs8YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqBzdG1wZTgxMUA0MSB7PGJyPg0KwqAg
wqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3N0LHN0
bXBlODExJnF1b3Q7Ozxicj4NCsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDQxJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpbnRlcnJ1cHRzID0gJmx0OzE1IElSUV9UWVBFX0VER0VfRkFMTElORyZndDs7PGJyPg0KwqAg
wqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsm
YW1wO2dwaW9hJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAv
KiAzLjI1IE1IeiBBREMgY2xvY2sgc3BlZWQgKi88YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdCxhZGMtZnJlcSA9ICZsdDsxJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiAxMi1iaXQgQURDICovPGJyPg0KwqAgwqAgwqAgwqAg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3QsbW9kLTEyYiA9ICZsdDsxJmd0Ozs8YnI+DQrCoCDC
oCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBpbnRlcm5hbCBBREMgcmVmZXJlbmNl
ICovPGJyPg0KwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3QscmVmLXNlbCA9
ICZsdDswJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBB
REMgY29udmVyc3Rpb24gdGltZTogODAgY2xvY2tzICovPGJyPg0KwqAgwqAgwqAgwqAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3Qsc2FtcGxlLXRpbWUgPSAmbHQ7NCZndDs7PGJyPg0KwqAgwqAg
wqAgwqAgKzxicj4NCsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0bXBlX3Rv
dWNoc2NyZWVuIHs8YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c3Qsc3RtcGUtdHMmcXVvdDs7PGJyPg0KwqAgwqAg
wqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogOCBzYW1wbGUgYXZl
cmFnZSBjb250cm9sICovPGJyPg0KwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3QsYXZlLWN0cmwgPSAmbHQ7MyZndDs7PGJyPg0KwqAgwqAgwqAgwqAgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogNyBsZW5ndGggZnJhY3Rpb25hbCBw
YXJ0IGluIHogKi88YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdCxmcmFjdGlvbi16ID0gJmx0OzcmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qPGJyPg0KwqAgwqAgwqAgwqAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogNTAgbUEgdHlwaWNhbCA4MCBtQSBtYXgg
dG91Y2hzY3JlZW48YnI+DQrCoCDCoCDCoCDCoCBkcml2ZXJzPGJyPg0KwqAgwqAgwqAgwqAgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogY3VycmVudCBsaW1pdCB2YWx1ZTxi
cj4NCsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxi
cj4NCsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0LGkt
ZHJpdmUgPSAmbHQ7MSZndDs7PGJyPg0KwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLyogMSBtcyBwYW5lbCBkcml2ZXIgc2V0dGxpbmcgdGltZSAqLzxicj4N
CsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0LHNldHRs
aW5nID0gJmx0OzMmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoC8qIDUgbXMgdG91Y2ggZGV0ZWN0IGludGVycnVwdCBkZWxheSAqLzxicj4N
CsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0LHRvdWNo
LWRldC1kZWxheSA9ICZsdDs1Jmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCsKgIMKgIMKgIMKgICs8YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdG1wZV9hZGMgezxicj4NCsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzdCxzdG1wZS1hZGMmcXVv
dDs7PGJyPg0KwqAgwqAgwqAgwqAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
LyogZm9yYmlkIHRvIHVzZSBBREMgY2hhbm5lbHMgMy0wICh0b3VjaCkgKi88YnI+DQrCoCDCoCDC
oCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdCxub3JlcXVlc3QtbWFz
ayA9ICZsdDsweDBGJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCsKgIMKgIMKgIMKgICvCoCDCoCDCoCDCoH07PGJyPg0KwqAgwqAgwqAgwqAgK307
PGJyPg0KPGJyPg0KPGJyPg0KwqAgwqAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPHdi
cj5fX19fX19fX19fX19fX19fXzxicj4NCsKgIMKgIGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0PGJyPg0KwqAgwqAgPGEgaHJlZj0ibWFpbHRvOmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZTx3YnI+YWQub3JnPC9hPjxicj4NCsKgIMKgICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmxpbnV4
LWFybS1rZXJuZWxAbGlzdHM8d2JyPi5pbmZyYWRlYWQub3JnPC9hPiZndDs8YnI+DQrCoCDCoCA8
YSBocmVmPSJodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWk8d2JyPmxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbDwvYT48YnI+DQrCoCDCoCAmbHQ7
PGEgaHJlZj0iaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWE8d2JyPmlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZTx3YnI+bDwvYT4mZ3Q7PGJyPg0K
PGJyPg0KPC9ibG9ja3F1b3RlPg0KPC9ibG9ja3F1b3RlPg0K
--000000000000b712e105a50e0222--

--===============3455642634227726795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3455642634227726795==--
