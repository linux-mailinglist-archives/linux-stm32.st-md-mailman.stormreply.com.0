Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rmt7N2hCV2oJIQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 10:18:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB875BCD1
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 10:18:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Y+vkypAF;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08AA3C58D7B;
	Wed, 15 Jul 2026 08:18:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96EB6C57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 08:18:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 782CF601E0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 08:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294681F00ACF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784103525;
 bh=8hGVZh4PoHLjhUPeUZDk7YT9r2Csoy+q60RG1t1sPcs=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc;
 b=Y+vkypAFF2VaKmeNBsJM168DosyIXULOV/1fpLuzsTul1sgGvXaBR4KZ6xOeIC+2j
 Ci+eiuoe5uMuHswoUkQiT4cMDUrKyJHoTFFQmF37me/jk2bry6CyrZbFe4/+NfwFcX
 SG7ighaYJUwUSjtA22Qc2YIC4pFU+ExRU41dvQRVxxFMEEaWzAjIETlABGoFhH67vD
 hcmZwvOC5bee6CUqAe029xw9LtrSlXAKvUsDYQycVXhHx0+E6TaxSvcfjZ5xskzofp
 L3QcfMeKA0I8rSRy0J4LVEzwZYEL7usUigDcxEmdjKlPkyB9vRYGbpTIPLxVrXraLs
 6i7e19kgfMjHw==
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39ca0a30148so40756571fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 01:18:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RpEKdy1UV/B8CeyU9y9XMkuRK+i6FsH0hh22/mJtcM2lk9lCPqhITA2GxTr2QMfRWm6eIoA8JuLH+jECA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9Vm20Kc4Lz7lurXlNQSOVau4m3b/yBiPQ6oXXnNR+p6RdJFpz
 w0AHFt0Uk6DrSU4Sd+LTt+dqgNHLv+h/YwrE+xNevdPlvxzPZnSvVwvCMpdTAP3psJaHlsDBO6N
 GXeaB0x3o7grjiMo95nS8KSXDoW+QCROrWGa0eOYysw==
X-Received: by 2002:a2e:a58f:0:b0:39c:7919:fcf1 with SMTP id
 38308e7fff4ca-39db6d81975mr4644921fa.33.1784103523816; Wed, 15 Jul 2026
 01:18:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:18:41 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:18:41 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260711210131.236025-3-marex@nabladev.com>
MIME-Version: 1.0
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-3-marex@nabladev.com>
Date: Wed, 15 Jul 2026 01:18:41 -0700
X-Gmail-Original-Message-ID: <CAMRc=McWngnxX1TE7jj+4hr25PN6o4rZGW+Jm2CivXtzA53CwA@mail.gmail.com>
X-Gm-Features: AUfX_mwKBsfMiGTO8O5kdCZA1clS20B1ees3zGV3oL0u74_c0uWhHuUReKtAFA8
Message-ID: <CAMRc=McWngnxX1TE7jj+4hr25PN6o4rZGW+Jm2CivXtzA53CwA@mail.gmail.com>
To: Marek Vasut <marex@nabladev.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/10] dt-bindings: gpio: pca95xx:
	Document Kinetic KTS1622
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:konstantin@linuxfoundation.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nabladev.com:email,dh-electronics.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69FB875BCD1

On Sat, 11 Jul 2026 22:59:31 +0200, Marek Vasut <marex@nabladev.com> said:
> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
> expander via the I2C bus for microcontrollers when additional I/Os
> are needed while keeping interconnections to the minimum. Datasheet
> comparison suggests that it is compatible with TCAL6416, add the
> compatible string and TCAL6416 as a fallback compatible.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 4f955f855e1ab..4631388a7d914 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -22,6 +22,9 @@ properties:
>        - items:
>            - const: diodes,pi4ioe5v6534q
>            - const: nxp,pcal6534
> +      - items:
> +          - const: kinetic,kts1622
> +          - const: ti,tcal6416
>        - items:
>            - enum:
>                - exar,xra1202
> --
> 2.53.0
>
>

Hi Konstantin!

I applied this patch with b4 and tried to generate the .thanks email. It failed
like so:

$ b4 ty -all
Auto-thankanating commits in gpio/for-next
Found 9 of your commits since 1.week
Calculating patch hashes, may take a moment...
  Located: [PATCH 00/10] arm64: dts: st: Add support for DH
electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and
DHSBC
---
Generating 1 thank-you letters
  Writing: ./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks
Traceback (most recent call last):
  File "/usr/bin/b4", line 8, in <module>
    sys.exit(cmd())
             ~~~^^
  File "/usr/lib/python3/dist-packages/b4/command.py", line 417, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/command.py", line 113, in cmd_ty
    b4.ty.main(cmdargs)
    ~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 681, in main
    auto_thankanator(cmdargs)
    ~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 386, in auto_thankanator
    send_messages(applied, wantbranch, cmdargs)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 452, in send_messages
    with open(outfile, 'wb') as fh:
         ~~~~^^^^^^^^^^^^^^^
OSError: [Errno 36] File name too long:
'./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks'

The name is under the 255 byte limit, is this a b4 bug/limitation?

Thanks,
Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
