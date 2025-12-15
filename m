Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD4CBCDAF
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 08:54:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 809B8C35E2B;
	Mon, 15 Dec 2025 07:54:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 203B6C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 07:54:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CBD0660142;
 Mon, 15 Dec 2025 07:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22802C19421;
 Mon, 15 Dec 2025 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765785266;
 bh=v/92elu0+HvI8sObJNUPXdOl7LjF+U9jY1BY0X5X81M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UyjrkH6KtnThxV3unDn7bby/GiiSiQSPftVpABjisSWU2uFJUOSoLOiJ1XOF8YjOp
 I40Nc0tRoSWwyXZw3oFdsyqnAaagma7510sWIAUaNrX4+PjLfSRLD+et/jmtmNvL+p
 fd4Yahc3vd/qAeYLCUCQr2QPTBPU15ibXG263IfBgtMJdpwq5a9dE2n/RsAVjJh07f
 tBknFVn5nsVHGveX55SVFDgvPqaXIiTsXroBhscCr8hxdkkc2/x2GJwzqKuPDYEuTo
 2nEzH829pMn8wb+YSsr4CldmREQ2VzSqT1cZK03HP02QTa8mhN+yfwFBVy6LBXOcO0
 DVK3rvhjXpeNg==
Date: Mon, 15 Dec 2025 16:54:11 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <aT--ox375kg2Mzh-@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 linux-rtc@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-security-module@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Olivia Mackall <olivia@selenic.com>, Michael Chan <michael.chan@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 linux-integrity@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 00/17] tee: Use bus callbacks instead
 of driver callbacks
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Dec 11, 2025 at 06:14:54PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> the objective of this series is to make tee driver stop using callbacks
> in struct device_driver. These were superseded by bus methods in 2006
> (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> methods.")) but nobody cared to convert all subsystems accordingly.
> =

> Here the tee drivers are converted. The first commit is somewhat
> unrelated, but simplifies the conversion (and the drivers). It
> introduces driver registration helpers that care about setting the bus
> and owner. (The latter is missing in all drivers, so by using these
> helpers the drivers become more correct.)
> =

> The patches #4 - #17 depend on the first two, so if they should be
> applied to their respective subsystem trees these must contain the first
> two patches first.

Thanks Uwe for your efforts to clean up the boilerplate code for TEE bus
drivers.

> =

> Note that after patch #2 is applied, unconverted drivers provoke a
> warning in driver_register(), so it would be good for the user
> experience if the whole series goes in during a single merge window.

+1

I suggest the whole series goes via the Jens tree since there shouldn't
be any chances for conflict here.

> So
> I guess an immutable branch containing the frist three patches that can
> be merged into the other subsystem trees would be sensible.
> =

> After all patches are applied, tee_bus_type can be made private to
> drivers/tee as it's not used in other places any more.
> =


Feel free to make the tee_bus_type private as the last patch in the series
such that any followup driver follows this clean approach.

-Sumit

> Best regards
> Uwe
> =

> Uwe Kleine-K=F6nig (17):
>   tee: Add some helpers to reduce boilerplate for tee client drivers
>   tee: Add probe, remove and shutdown bus callbacks to tee_client_driver
>   tee: Adapt documentation to cover recent additions
>   hwrng: optee - Make use of module_tee_client_driver()
>   hwrng: optee - Make use of tee bus methods
>   rtc: optee: Migrate to use tee specific driver registration function
>   rtc: optee: Make use of tee bus methods
>   efi: stmm: Make use of module_tee_client_driver()
>   efi: stmm: Make use of tee bus methods
>   firmware: arm_scmi: optee: Make use of module_tee_client_driver()
>   firmware: arm_scmi: Make use of tee bus methods
>   firmware: tee_bnxt: Make use of module_tee_client_driver()
>   firmware: tee_bnxt: Make use of tee bus methods
>   KEYS: trusted: Migrate to use tee specific driver registration
>     function
>   KEYS: trusted: Make use of tee bus methods
>   tpm/tpm_ftpm_tee: Make use of tee specific driver registration
>   tpm/tpm_ftpm_tee: Make use of tee bus methods
> =

>  Documentation/driver-api/tee.rst             | 18 +----
>  drivers/char/hw_random/optee-rng.c           | 26 ++----
>  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
>  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
>  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
>  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
>  drivers/rtc/rtc-optee.c                      | 27 ++-----
>  drivers/tee/tee_core.c                       | 84 ++++++++++++++++++++
>  include/linux/tee_drv.h                      | 12 +++
>  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
>  10 files changed, 164 insertions(+), 138 deletions(-)
> =

> =

> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> -- =

> 2.47.3
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
