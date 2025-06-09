Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08058AD1A07
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jun 2025 10:51:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE469C32E8E;
	Mon,  9 Jun 2025 08:51:12 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95DA8C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 08:51:10 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-55220699ba8so5075053e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jun 2025 01:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749459070; x=1750063870;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y2qXWzvrDdoHoEJaJ8X2ylSjSTDoXl7r3jfJOIs6YPU=;
 b=AbAG0f0PDoSnh8sH+blW58RcQN0FK9qw7Bj42AKTTHqcKkGlcGmBSgHynHkPDka70+
 UXfqAJi3DdrIBxIbXWxoeds4LAr2ACLBvqHbUQb72u8b1/RQg6jjsx9IoHtv20iqdSJJ
 xJuBp8ijyQDznBni4EBsP36RLeURQy9bhQLIeAUS1ZBfnDkWLmU4v5vtWV7XdvjDH6Uw
 me367igcBE8lUEfJRwlfpPmt4y2mUaS1q/FomB76/YsSpyarffoUbRmpz+Ibco37lfId
 KrP074bEqyF2Js2OrAkjC9FeHQSjiWzwDy2L9uDKYAr95mZffRwPJo20kPHB9LlI0+6L
 rJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749459070; x=1750063870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y2qXWzvrDdoHoEJaJ8X2ylSjSTDoXl7r3jfJOIs6YPU=;
 b=YdHgvWp5CQtFO0xCPOxHr5K3ch47yTx6aS+lOj5i3pFrsx5VuZlaW6uwxQidYaSB0K
 Qi1vkjIkSDRlJYVyZfcXdbBp4UdHY4XyehcEMsHb/VGJBbQxpHdj8HcoEkHJ4EbPnY/X
 w19cjcGHljXRaulI2DzUuaoN2//tRTh5cs24bMS3tA7r2z0Z5f4YTpWh3/DXERsMH8dQ
 mdvCACsNNyF/7NBZDBAiWfwzl9Wux0teZyQBJFRPSN6d0Y+1cDFvCZVB9pH1d4WFieIs
 WXbTOqOA8l616nJtUjlX/SDRgOV+Mp+pEQWaNre9iTlpKbiSjIAfhYkgqoo9tzekN8zI
 QTvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjLtyPrLMKSvRJmJC4Vzv0R0yDeHZRgIcu1eolZyWjBp16OvBCrAAR+Qs4UsMt6IoquvnsT0yyIZ7REQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz50+oP220QBlj/gOz64uxWjsePH69KNCyfYGqEPVNHt8o1I8hy
 PYxAREGHc7YYIpsm6mlEg548M/mGagOxWxahu6PXTQaziR5IhJwI/VGff3lEi/vd8MYTOIaBaBX
 ceKvdnWTySDN+ZNmUvTiNSTHOXb8Ak1g=
X-Gm-Gg: ASbGncs1LR7fQXziOXzkTytiMXWTRdmzNIzPIdUTcxaECvL6BVDkAfMj8vmiKLEVGaz
 1Pb6csf632vkjKyQiyl2D5LTA78U56bty8aheWxjKu1iyYuDyLodQF80S48tMxXs49W/pzBajqI
 Hn9EpqlxpS9I0PLGM241tDyo9IiXSQ4Nz1ag==
X-Google-Smtp-Source: AGHT+IF0y9JQTnUS1mIGy7TKfnPeya4nzTMolDcsFu2nC/mpuSz6WyPLr1AvUr+RuYJEYV6Mdq6pkOy59Qqv11wLL4E=
X-Received: by 2002:a05:6512:114c:b0:553:2c92:a867 with SMTP id
 2adb3069b0e04-55366c3869fmr3163167e87.55.1749459069309; Mon, 09 Jun 2025
 01:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
 <20250607162110.GB197663@horms.kernel.org>
In-Reply-To: <20250607162110.GB197663@horms.kernel.org>
From: =?UTF-8?B?QmFydMWCb21pZWogRHppxIVn?= <bartlomiejdziag@gmail.com>
Date: Mon, 9 Jun 2025 10:50:57 +0200
X-Gm-Features: AX0GCFuh48hzrJD3RWtXOgVEpsZwW5dbOSvBlBRCvNND-RAUdg624WYOoQR19Ps
Message-ID: <CAK-9ZytCy8Yja60JowiBTCH009y4rdXVUpCOGfG58mV0mTh_pg@mail.gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Wojciech Drewek <wojciech.drewek@intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Change the busy-wait loops
	timing
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
Content-Type: multipart/mixed; boundary="===============2628064429516579963=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2628064429516579963==
Content-Type: multipart/alternative; boundary="000000000000601b0106371fae2d"

--000000000000601b0106371fae2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon, Andrew,

Let me provide some context. We have a platform with a Qualcomm SA522M chip
and an 88Q2221MB2 Marvel Ethernet PHY. We use the ptp4l application to
synchronize the local /dev/ptp0 clock with the time from an external
grandmaster (802.1AS-2011 gPTP time synchronization). Ptp4l is part of the
open-source LinuxPTP project. We have observed a very high CPU usage by
ptp4:

02:21:24      UID       PID    %usr %system  %guest   %wait    %CPU   CPU
 Command
02:21:25     1072      1660    0.00    8.00         0.00      1.00
 8.00       0     ptp4l
02:21:26     1072      1660    0.00    9.00         0.00      0.00
 9.00       0     ptp4l
02:21:27     1072      1660    0.00    9.90         0.00      0.99
 9.90       1     ptp4l
02:21:28     1072      1660    0.00    7.00         0.00      0.00
 7.00       1     ptp4l
02:21:29     1072      1660    0.00    9.00         0.00      0.00
 9.00       0     ptp4l
02:21:30     1072      1660    0.00    9.00         0.00      1.00
 9.00       1     ptp4l

I also measured the syscalls:
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
93.93    8.250598       10073       819           clock_adjtime
  3.16    0.277860         206      1345           ppoll
  1.56    0.137313          70      1944           recvmsg
  0.64    0.055852         140       397           sendto
  0.56    0.049168          53       921           timerfd_settime
  0.15    0.013388          69       193           recvfrom
------ ----------- ----------- --------- --------- ----------------
100.00    8.784179                  5619           total

Does it always take much less than 10ms, or is that usually so.
> If it is the former, then do we need to wait for in the order of
> 10000 x 5us =3D 50ms before giving up?


Considering 8 sync messages per second, I have observed that around 85% of
"config_addend" calls takes more than 10 milliseconds to complete. I have
measured that by simply using the ktime API. When I completely deleted the
delay from the while loop, I saw that it took a maximum of 1.6 microseconds
to finish the addend update. I decided to just change the delay to 5
microseconds, as in my opinion a 10 millisecond of a busy-loop is a
overkill. The same measurements with lower delay:

01:01:13      UID       PID    %usr %system  %guest   %wait    %CPU   CPU
 Command
01:01:14     1072       710    0.00    1.00    0.00    0.00    1.00     0
 ptp4l
01:01:15     1072       710    0.00    0.00    0.00    0.00    0.00     1
 ptp4l
01:01:16     1072       710    0.00    1.00    0.00    0.00    1.00     0
 ptp4l
01:01:17     1072       710    0.00    1.00    0.00    0.00    1.00     0
 ptp4l
01:01:18     1072       710    0.00    1.00    0.00    0.00    1.00     0
 ptp4l
01:01:19     1072       710    0.00    1.00    0.00    0.00    1.00     1
 ptp4l
01:01:20     1072       710    0.00    1.00    0.00    0.00    1.00     1
 ptp4l
01:01:21     1072       710    0.00    1.00    0.00    1.00    1.00     0
 ptp4l
01:01:22     1072       710    0.00    0.00    0.00    0.00    0.00     0
 ptp4l
01:01:23     1072       710    1.00    0.00    0.00    0.00    1.00     1
 ptp4l
01:01:24     1072       710    0.00    1.00    0.00    0.00    1.00     1
 ptp4l

% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 49.12    0.161379         191       843           ppoll
 22.41    0.073623          62      1184           recvmsg
  9.31    0.030585         125       244           sendto
  8.71    0.028625          57       499           clock_adjtime
  8.33    0.027364          48       561           timerfd_settime
  2.13    0.006996          58       119           recvfrom
------ ----------- ----------- --------- --------- ----------------
100.00    0.328572                  3450           total

I would actually suggest rewriting this using the macros from iopoll.h.


I will try rewriting it using macros from iopoll.h

Thanks,
Bartlomiej Dziag

sob., 7 cze 2025 o 18:21 Simon Horman <horms@kernel.org> napisa=C5=82(a):

> On Fri, Jun 06, 2025 at 12:19:49PM +0200, Bartlomiej Dziag wrote:
> > After writing a new value to the PTP_TAR or PTP_STSUR registers,
> > the driver waits for the addend/adjust operations to complete.
> > Sometimes, the first check operation fails, resulting in
> > a 10 milliseconds busy-loop before performing the next check.
> > Since updating the registers takes much less than 10 milliseconds,
> > the kernel gets stuck unnecessarily. This may increase the CPU usage.
> > Fix that with changing the busy-loop interval to 5 microseconds.
> > The registers will be checked more often.
>
> Hi Bartlomiej,
>
> I am curious.
>
> Does it always take much less than 10ms, or is that usually so.
> If it is the former, then do we need to wait for in the order of
> 10000 x 5us =3D 50ms before giving up?
>
> >
> > Signed-off-by: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
>
> ...
>

--000000000000601b0106371fae2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBTaW1vbiwgQW5kcmV3LDwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+TGV0IG1lIHByb3ZpZGUgc29tZSBjb250ZXh0LiBXZSBoYXZlIGEgcGxhdGZvcm0gd2l0
aCBhIFF1YWxjb21tIFNBNTIyTSBjaGlwIGFuZCBhbiA4OFEyMjIxTUIyIE1hcnZlbCBFdGhlcm5l
dCBQSFkuIFdlIHVzZSB0aGUgcHRwNGwgYXBwbGljYXRpb24gdG8gc3luY2hyb25pemUgdGhlIGxv
Y2FsIC9kZXYvcHRwMCBjbG9jayB3aXRoIHRoZSB0aW1lIGZyb20gYW4gZXh0ZXJuYWwgZ3JhbmRt
YXN0ZXIgKDgwMi4xQVMtMjAxMSBnUFRQIHRpbWUgc3luY2hyb25pemF0aW9uKS4gUHRwNGwgaXMg
cGFydCBvZiB0aGUgb3Blbi1zb3VyY2UgTGludXhQVFAgcHJvamVjdC7CoFdlIGhhdmUgb2JzZXJ2
ZWQgYSB2ZXJ5IGhpZ2ggQ1BVIHVzYWdlIGJ5IHB0cDQ6PGJyPjxicj4wMjoyMToyNCDCoCDCoCDC
oFVJRCDCoCDCoCDCoCBQSUQgwqAgwqAldXNyICVzeXN0ZW0gwqAlZ3Vlc3QgwqAgJXdhaXQgwqAg
wqAlQ1BVIMKgIENQVSDCoENvbW1hbmQ8YnI+MDI6MjE6MjUgwqAgwqAgMTA3MiDCoCDCoCDCoDE2
NjAgwqAgwqAwLjAwIMKgIMKgOC4wMMKgIMKgIMKgIMKgIMKgMC4wMMKgIMKgIMKgIDEuMDDCoCDC
oCDCoCDCoDguMDDCoCDCoCDCoCDCoDDCoCDCoCDCoHB0cDRsPGJyPjAyOjIxOjI2IMKgIMKgIDEw
NzIgwqAgwqAgwqAxNjYwIMKgIMKgMC4wMCDCoCDCoDkuMDDCoCDCoCDCoCDCoCDCoDAuMDDCoCDC
oCDCoCAwLjAwwqAgwqAgwqAgwqA5LjAwwqAgwqAgwqAgwqAwwqAgwqAgwqBwdHA0bDxicj4wMjoy
MToyNyDCoCDCoCAxMDcyIMKgIMKgIMKgMTY2MCDCoCDCoDAuMDAgwqAgwqA5LjkwwqAgwqAgwqAg
wqAgwqAwLjAwwqAgwqAgwqAgMC45OcKgIMKgIMKgIMKgOS45MMKgIMKgIMKgIMKgMcKgIMKgIMKg
cHRwNGw8YnI+MDI6MjE6MjggwqAgwqAgMTA3MiDCoCDCoCDCoDE2NjAgwqAgwqAwLjAwIMKgIMKg
Ny4wMMKgIMKgIMKgIMKgIMKgMC4wMMKgIMKgIMKgIDAuMDDCoCDCoCDCoCDCoDcuMDDCoCDCoCDC
oCDCoDHCoCDCoCDCoHB0cDRsPGJyPjAyOjIxOjI5IMKgIMKgIDEwNzIgwqAgwqAgwqAxNjYwIMKg
IMKgMC4wMCDCoCDCoDkuMDDCoCDCoCDCoCDCoCDCoDAuMDDCoCDCoCDCoCAwLjAwwqAgwqAgwqAg
wqA5LjAwwqAgwqAgwqAgwqAwwqAgwqAgwqBwdHA0bDxicj4wMjoyMTozMCDCoCDCoCAxMDcyIMKg
IMKgIMKgMTY2MCDCoCDCoDAuMDAgwqAgwqA5LjAwwqAgwqAgwqAgwqAgwqAwLjAwwqAgwqAgwqAg
MS4wMMKgIMKgIMKgIMKgOS4wMMKgIMKgIMKgIMKgMcKgIMKgIMKgcHRwNGw8L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PkkgYWxzbyBtZWFzdXJlZCB0aGUgc3lzY2FsbHM6PGJyPiUgdGltZSDCoCDC
oCBzZWNvbmRzIMKgdXNlY3MvY2FsbCDCoCDCoCBjYWxscyDCoCDCoGVycm9ycyBzeXNjYWxsPGJy
Pi0tLS0tLSAtLS0tLS0tLS0tLSAtLS0tLS0tLS0tLSAtLS0tLS0tLS0gLS0tLS0tLS0tIC0tLS0t
LS0tLS0tLS0tLS08YnI+OTMuOTMgwqAgwqA4LjI1MDU5OCDCoCDCoCDCoCAxMDA3MyDCoCDCoCDC
oCA4MTkgwqAgwqAgwqAgwqAgwqAgY2xvY2tfYWRqdGltZTxicj7CoCAzLjE2IMKgIMKgMC4yNzc4
NjAgwqAgwqAgwqAgwqAgMjA2IMKgIMKgIMKgMTM0NSDCoCDCoCDCoCDCoCDCoCBwcG9sbDxicj7C
oCAxLjU2IMKgIMKgMC4xMzczMTMgwqAgwqAgwqAgwqAgwqA3MCDCoCDCoCDCoDE5NDQgwqAgwqAg
wqAgwqAgwqAgcmVjdm1zZzxicj7CoCAwLjY0IMKgIMKgMC4wNTU4NTIgwqAgwqAgwqAgwqAgMTQw
IMKgIMKgIMKgIDM5NyDCoCDCoCDCoCDCoCDCoCBzZW5kdG88YnI+wqAgMC41NiDCoCDCoDAuMDQ5
MTY4IMKgIMKgIMKgIMKgIMKgNTMgwqAgwqAgwqAgOTIxIMKgIMKgIMKgIMKgIMKgIHRpbWVyZmRf
c2V0dGltZTxicj7CoCAwLjE1IMKgIMKgMC4wMTMzODggwqAgwqAgwqAgwqAgwqA2OSDCoCDCoCDC
oCAxOTMgwqAgwqAgwqAgwqAgwqAgcmVjdmZyb208YnI+LS0tLS0tIC0tLS0tLS0tLS0tIC0tLS0t
LS0tLS0tIC0tLS0tLS0tLSAtLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLTxicj4xMDAuMDAgwqAg
wqA4Ljc4NDE3OSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDU2MTkgwqAgwqAgwqAgwqAgwqAg
dG90YWw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJn
YigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+RG9lcyBpdCBhbHdheXMgdGFrZSBtdWNo
IGxlc3MgdGhhbiAxMG1zLCBvciBpcyB0aGF0IHVzdWFsbHkgc28uPGJyPg0KSWYgaXQgaXMgdGhl
IGZvcm1lciwgdGhlbiBkbyB3ZSBuZWVkIHRvIHdhaXQgZm9yIGluIHRoZSBvcmRlciBvZjxicj4N
CjEwMDAwIHggNXVzID0gNTBtcyBiZWZvcmUgZ2l2aW5nIHVwPzwvYmxvY2txdW90ZT48ZGl2Pjxi
cj48L2Rpdj48ZGl2PkNvbnNpZGVyaW5nIDggc3luYyBtZXNzYWdlcyBwZXIgc2Vjb25kLCBJIGhh
dmUgb2JzZXJ2ZWQgdGhhdCBhcm91bmQgODUlIG9mICZxdW90O2NvbmZpZ19hZGRlbmQmcXVvdDsg
Y2FsbHMgdGFrZXMgbW9yZSB0aGFuIDEwIG1pbGxpc2Vjb25kcyB0byBjb21wbGV0ZS4gSSBoYXZl
IG1lYXN1cmVkIHRoYXQgYnkgc2ltcGx5IHVzaW5nIHRoZSBrdGltZSBBUEkuIFdoZW4gSSBjb21w
bGV0ZWx5IGRlbGV0ZWQgdGhlIGRlbGF5IGZyb20gdGhlIHdoaWxlIGxvb3AsIEkgc2F3IHRoYXQg
aXQgdG9vayBhIG1heGltdW0gb2YgMS42IG1pY3Jvc2Vjb25kcyB0byBmaW5pc2ggdGhlIGFkZGVu
ZCB1cGRhdGUuIEkgZGVjaWRlZCB0byBqdXN0IGNoYW5nZSB0aGUgZGVsYXkgdG8gNSBtaWNyb3Nl
Y29uZHMsIGFzIGluIG15IG9waW5pb24gYSAxMCBtaWxsaXNlY29uZCBvZiBhIGJ1c3ktbG9vcCBp
cyBhIG92ZXJraWxsLiBUaGUgc2FtZSBtZWFzdXJlbWVudHMgd2l0aCBsb3dlciBkZWxheTo8L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PjAxOjAxOjEzIMKgIMKgIMKgVUlEIMKgIMKgIMKgIFBJRCDC
oCDCoCV1c3IgJXN5c3RlbSDCoCVndWVzdCDCoCAld2FpdCDCoCDCoCVDUFUgwqAgQ1BVIMKgQ29t
bWFuZDxicj4wMTowMToxNCDCoCDCoCAxMDcyIMKgIMKgIMKgIDcxMCDCoCDCoDAuMDAgwqAgwqAx
LjAwIMKgIMKgMC4wMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgIDAgwqBwdHA0bDxicj4wMTow
MToxNSDCoCDCoCAxMDcyIMKgIMKgIMKgIDcxMCDCoCDCoDAuMDAgwqAgwqAwLjAwIMKgIMKgMC4w
MCDCoCDCoDAuMDAgwqAgwqAwLjAwIMKgIMKgIDEgwqBwdHA0bDxicj4wMTowMToxNiDCoCDCoCAx
MDcyIMKgIMKgIMKgIDcxMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgMC4wMCDCoCDCoDAuMDAg
wqAgwqAxLjAwIMKgIMKgIDAgwqBwdHA0bDxicj4wMTowMToxNyDCoCDCoCAxMDcyIMKgIMKgIMKg
IDcxMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgMC4wMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKg
IMKgIDAgwqBwdHA0bDxicj4wMTowMToxOCDCoCDCoCAxMDcyIMKgIMKgIMKgIDcxMCDCoCDCoDAu
MDAgwqAgwqAxLjAwIMKgIMKgMC4wMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgIDAgwqBwdHA0
bDxicj4wMTowMToxOSDCoCDCoCAxMDcyIMKgIMKgIMKgIDcxMCDCoCDCoDAuMDAgwqAgwqAxLjAw
IMKgIMKgMC4wMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgIDEgwqBwdHA0bDxicj4wMTowMToy
MCDCoCDCoCAxMDcyIMKgIMKgIMKgIDcxMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgMC4wMCDC
oCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgIDEgwqBwdHA0bDxicj4wMTowMToyMSDCoCDCoCAxMDcy
IMKgIMKgIMKgIDcxMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgMC4wMCDCoCDCoDEuMDAgwqAg
wqAxLjAwIMKgIMKgIDAgwqBwdHA0bDxicj4wMTowMToyMiDCoCDCoCAxMDcyIMKgIMKgIMKgIDcx
MCDCoCDCoDAuMDAgwqAgwqAwLjAwIMKgIMKgMC4wMCDCoCDCoDAuMDAgwqAgwqAwLjAwIMKgIMKg
IDAgwqBwdHA0bDxicj4wMTowMToyMyDCoCDCoCAxMDcyIMKgIMKgIMKgIDcxMCDCoCDCoDEuMDAg
wqAgwqAwLjAwIMKgIMKgMC4wMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgIDEgwqBwdHA0bDxi
cj4wMTowMToyNCDCoCDCoCAxMDcyIMKgIMKgIMKgIDcxMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKg
IMKgMC4wMCDCoCDCoDAuMDAgwqAgwqAxLjAwIMKgIMKgIDEgwqBwdHA0bDwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+JSB0aW1lIMKgIMKgIHNlY29uZHMgwqB1c2Vjcy9jYWxsIMKgIMKgIGNhbGxz
IMKgIMKgZXJyb3JzIHN5c2NhbGw8YnI+LS0tLS0tIC0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tIC0t
LS0tLS0tLSAtLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLTxicj7CoDQ5LjEyIMKgIMKgMC4xNjEz
NzkgwqAgwqAgwqAgwqAgMTkxIMKgIMKgIMKgIDg0MyDCoCDCoCDCoCDCoCDCoCBwcG9sbDxicj7C
oDIyLjQxIMKgIMKgMC4wNzM2MjMgwqAgwqAgwqAgwqAgwqA2MiDCoCDCoCDCoDExODQgwqAgwqAg
wqAgwqAgwqAgcmVjdm1zZzxicj7CoCA5LjMxIMKgIMKgMC4wMzA1ODUgwqAgwqAgwqAgwqAgMTI1
IMKgIMKgIMKgIDI0NCDCoCDCoCDCoCDCoCDCoCBzZW5kdG88YnI+wqAgOC43MSDCoCDCoDAuMDI4
NjI1IMKgIMKgIMKgIMKgIMKgNTcgwqAgwqAgwqAgNDk5IMKgIMKgIMKgIMKgIMKgIGNsb2NrX2Fk
anRpbWU8YnI+wqAgOC4zMyDCoCDCoDAuMDI3MzY0IMKgIMKgIMKgIMKgIMKgNDggwqAgwqAgwqAg
NTYxIMKgIMKgIMKgIMKgIMKgIHRpbWVyZmRfc2V0dGltZTxicj7CoCAyLjEzIMKgIMKgMC4wMDY5
OTYgwqAgwqAgwqAgwqAgwqA1OCDCoCDCoCDCoCAxMTkgwqAgwqAgwqAgwqAgwqAgcmVjdmZyb208
YnI+LS0tLS0tIC0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tIC0tLS0tLS0tLSAtLS0tLS0tLS0gLS0t
LS0tLS0tLS0tLS0tLTxicj4xMDAuMDAgwqAgwqAwLjMyODU3MiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoDM0NTAgwqAgwqAgwqAgwqAgwqAgdG90YWw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44
ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFl
eCI+SSB3b3VsZCBhY3R1YWxseSBzdWdnZXN0IHJld3JpdGluZyB0aGlzIHVzaW5nIHRoZSBtYWNy
b3MgZnJvbSBpb3BvbGwuaC48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHdpbGwg
dHJ5IHJld3JpdGluZyBpdCB1c2luZyBtYWNyb3MgZnJvbSBpb3BvbGwuaDwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+VGhhbmtzLDxicj48L2Rpdj48ZGl2PkJhcnRsb21pZWogRHppYWc8L2Rpdj48
L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUgZ21haWxfcXVvdGVfY29udGFpbmVyIj48
ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+c29iLiwgNyBjemUgMjAyNSBvIDE4OjIx
wqBTaW1vbiBIb3JtYW4gJmx0OzxhIGhyZWY9Im1haWx0bzpob3Jtc0BrZXJuZWwub3JnIj5ob3Jt
c0BrZXJuZWwub3JnPC9hPiZndDsgbmFwaXNhxYIoYSk6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNs
YXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXIt
bGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiBGcmks
IEp1biAwNiwgMjAyNSBhdCAxMjoxOTo0OVBNICswMjAwLCBCYXJ0bG9taWVqIER6aWFnIHdyb3Rl
Ojxicj4NCiZndDsgQWZ0ZXIgd3JpdGluZyBhIG5ldyB2YWx1ZSB0byB0aGUgUFRQX1RBUiBvciBQ
VFBfU1RTVVIgcmVnaXN0ZXJzLDxicj4NCiZndDsgdGhlIGRyaXZlciB3YWl0cyBmb3IgdGhlIGFk
ZGVuZC9hZGp1c3Qgb3BlcmF0aW9ucyB0byBjb21wbGV0ZS48YnI+DQomZ3Q7IFNvbWV0aW1lcywg
dGhlIGZpcnN0IGNoZWNrIG9wZXJhdGlvbiBmYWlscywgcmVzdWx0aW5nIGluPGJyPg0KJmd0OyBh
IDEwIG1pbGxpc2Vjb25kcyBidXN5LWxvb3AgYmVmb3JlIHBlcmZvcm1pbmcgdGhlIG5leHQgY2hl
Y2suPGJyPg0KJmd0OyBTaW5jZSB1cGRhdGluZyB0aGUgcmVnaXN0ZXJzIHRha2VzIG11Y2ggbGVz
cyB0aGFuIDEwIG1pbGxpc2Vjb25kcyw8YnI+DQomZ3Q7IHRoZSBrZXJuZWwgZ2V0cyBzdHVjayB1
bm5lY2Vzc2FyaWx5LiBUaGlzIG1heSBpbmNyZWFzZSB0aGUgQ1BVIHVzYWdlLjxicj4NCiZndDsg
Rml4IHRoYXQgd2l0aCBjaGFuZ2luZyB0aGUgYnVzeS1sb29wIGludGVydmFsIHRvIDUgbWljcm9z
ZWNvbmRzLjxicj4NCiZndDsgVGhlIHJlZ2lzdGVycyB3aWxsIGJlIGNoZWNrZWQgbW9yZSBvZnRl
bi48YnI+DQo8YnI+DQpIaSBCYXJ0bG9taWVqLDxicj4NCjxicj4NCkkgYW0gY3VyaW91cy48YnI+
DQo8YnI+DQpEb2VzIGl0IGFsd2F5cyB0YWtlIG11Y2ggbGVzcyB0aGFuIDEwbXMsIG9yIGlzIHRo
YXQgdXN1YWxseSBzby48YnI+DQpJZiBpdCBpcyB0aGUgZm9ybWVyLCB0aGVuIGRvIHdlIG5lZWQg
dG8gd2FpdCBmb3IgaW4gdGhlIG9yZGVyIG9mPGJyPg0KMTAwMDAgeCA1dXMgPSA1MG1zIGJlZm9y
ZSBnaXZpbmcgdXA/PGJyPg0KPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFNpZ25lZC1vZmYtYnk6IEJh
cnRsb21pZWogRHppYWcgJmx0OzxhIGhyZWY9Im1haWx0bzpiYXJ0bG9taWVqZHppYWdAZ21haWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+YmFydGxvbWllamR6aWFnQGdtYWlsLmNvbTwvYT4mZ3Q7PGJy
Pg0KPGJyPg0KLi4uPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--000000000000601b0106371fae2d--

--===============2628064429516579963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2628064429516579963==--
