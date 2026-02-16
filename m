Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHBMLEPokmlSzwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 10:49:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517114210C
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 10:49:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF5F8C8F273;
	Mon, 16 Feb 2026 09:49:54 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC31FC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 09:49:53 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-64ad8435f46so2570763d50.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 01:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771235392; cv=none;
 d=google.com; s=arc-20240605;
 b=e4ZWTQW9t9/sDXA6LYDAkYQ6Dhrtm7gYUmqCay80vgzgZtnO/H0Lm0VvEJaJ0hmc4Q
 D9ZF1ypUy2ouCd3lw7HKuOCYouaLJ51g3KwOF2B0dvHYErIe48QGtL3sJCMRQ9OOvakJ
 WXvtFm5gnslQjCjyUNu1hUqvKegNl8JSvbfenI7G/as63EPJrqcIYJBFPTL8Lk4MxNaQ
 ya7K18TSDDqTn4Y2l6Du0FjPmPo5WuVn+jn1fd2xQ1NO0I+t+9A9F1SzMHTQOGuTcgIH
 aUGuWG5XQN3g2ZIMCWl+o2osHBuR+96xaIgu2oIziCClXy56+W5TgrKUFpoIDQMJRKQV
 +8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9KcAyYM/+QmM79Ib7dGqCC4dBkpE2RdJ6RsVIfszKMk=;
 fh=fjbVlzFQqUJikqRPje54FooQTQ3WSMjKu/vJT0SDSD4=;
 b=Qs9aY9IvW/KLejCY1w1yQu6XapO/naE59NMAIOeWkrELbx7o0IACMYCXym/q5+enne
 NbXqar6vl/YOhuXugh+nnGctdp6C2G0+g9v31I5yPDlFPc5CApR1sButxijo/DmJNkRW
 1cNJvwQuB5DVngAzL8hQm6EEakoKTK4KL2q6aATAvLBLw9jbBQr8DQmxoEcNGBnTucHX
 qzcvYLisq1bmUblCPhyAtxyX2aF+5zJbF1PlRGGn4Pf47uwYwVrtO6U18Jo15pal1Pbb
 cw9bORsYh9gysAiTmnpqPnhVL8RA1fMD2/c891V6wOfL66q2L1MV/TNySxttnWg9I9S3
 aczQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771235392; x=1771840192;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9KcAyYM/+QmM79Ib7dGqCC4dBkpE2RdJ6RsVIfszKMk=;
 b=IQeIW56dkEJgtSXcvlVGOwsAy+dm3oycRgmirZya3t+TAySJTPT4nDnRnm3PqtHuE3
 JDjGb3/zunyNLVj0M4JZOlDkJPRZSK6zaoSJcJwUOKMBWVAZnhRHaALRSECOEMfshzHY
 0+lj0goWiFJ72rF+Jm8iwcED2phShUw1+39kGmN3iCf+GRAEE4GLTWKArRG3gUztQutC
 KoWY4CyNiH6BC/Jw/HKEvL88rkqRHjRiflER6LR3fEKcAx5lbcTVn2uaCj8alu0eXu0t
 I3kev1cnDHDdWvITe6Iar3Mgo/h43+2JebEKs/+AHQE2gK5DXlEvi8NzJMaKrF5vBmfh
 kxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771235392; x=1771840192;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9KcAyYM/+QmM79Ib7dGqCC4dBkpE2RdJ6RsVIfszKMk=;
 b=myTZziCaiCN9+mxGJmiuAMNo6gbM9w0EqDVMS+aYJBpE3lITBN+lEh1+Bo+IUsmhgx
 i5CIXr+8eFE1H9ZBskHZ1zjKgxztjbHhlAAG0gx45Ep7hYi1WsvmzvzzRmlERJ+JDCRh
 UaLIWbK9aUPuF11TBDbvVcWdaAtJBSAwyYano/8zR7KcneC/XWFVHkElX9l/BQMBTvlJ
 HpbMAwExfwiuJ4svJYYuMxjaqRfjZ2HIxQTVt4sFDQG9aRHNrcH47zprFsRCumpLNlQI
 inu2qJje+JKcN5QFP0VGSS9e88fwxscZfnmAg6OnqIjPbF0Rmekjc59hAxWnu88WTAxf
 eoLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOeizDOGZH4BYeM/zxwy24OGtSo2GWkf1K8vMVsVWOEEjzysDFubZygpLvPLOkmSzpr+JZ2AmgsCd1PQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2dwlyw040+d9Se4tgattr4+QTiAYL8/0WvcNxiU95kw/lLVUq
 z4aUPfsw4ytxShaZ/8WNyjO3BhoG4Njcb+Rr2AGClEwJHc4gHU++HaPfHh3ATuLkBUbXu+JWdth
 ds1HSNfZUfmitEqh5KZ2euFRxub6DBbCp6NC2X1lz9Q==
X-Gm-Gg: AZuq6aINPkBCsa0nFw3XoyWllccBQuH8871KEgoMxTB+u1zDgpCdfJq1T5ZBq/7WJOR
 hLQTWHfz70hyhUZjNZ4H7gu6R1DP4w/6b8Ek07eku1uChcrqa9MQ4oFXnHOGTjQzcpltM5Jv84N
 n+uf5QrA1VszEYC+VI/IHK4TDc3euZWsIfHe91BJJJCeEQoEB6sKiC13xGcbhB9TFkO9xTikW36
 oLjg9CkKXvb0BkrfbwdtY6nPyJBqaoEfB1+0/sS8BgYhHE83nQnq4nvBWD6fTHbxjo/sfgDdnfQ
 ShVg+374nfwn9ltnAbqCHzV47QK0AD2EfOrmNWvEt7D0yjEn5lBCOSS4d/uMze3ARdQoKOPRi+F
 eOcVVfRE6TuZrzKS9nMDA0AywkI4jnhcfBXsXWeDCUOwYzSvEzPtEoWxHO6trqIeh7f96LlgNig
 aEnQg1tnElY5GVzGbS9rxb4fxwKU6SdIjHGM+FcNmNnYGsO290iWvbeLYqDtmpOTtfX8dKnoKzN
 ZKY5xCT7jWOwqzTQR440NKiXneuZZ/UDxH/fO3LP4O/fBoBhNDf7IJ3HWrQt4Y0VFfOGK3s0pig
 zSdSn3ZZ1n+7T2biRj07JBuHieNKeDK1c0A+bDbckM+0
X-Received: by 2002:a05:690e:1503:b0:649:44ac:cc01 with SMTP id
 956f58d0204a3-64c21b18a02mr5405053d50.55.1771235392354; Mon, 16 Feb 2026
 01:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 16 Feb 2026 11:49:16 +0200
X-Gm-Features: AZwV_QiWccMZyM72m_4_u3dE4MCMJlyOZRCqnU7JaUjXWUFD4VNEgOXyE-7aI8E
Message-ID: <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] efi: stmm: Constify struct
	efivar_operations
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ardb@kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ilias.apalodimas@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilias.apalodimas@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 4517114210C
X-Rspamd-Action: no action

Hi Krzysztof,

On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> The 'struct efivar_operations' is not modified by the driver after
> initialization, so it should follow typical practice of being static
> const for increased code safety and readability.

get_maintainers doesn't include me in the cc list?

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> index 7b04dd649629..3bea2ef50ef3 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -14,7 +14,6 @@
>  #include "mm_communication.h"
>
>  static struct efivars tee_efivars;
> -static struct efivar_operations tee_efivar_ops;
>
>  static size_t max_buffer_size; /* comm + var + func + data */
>  static size_t max_payload_size; /* func + data */
> @@ -520,6 +519,15 @@ static void tee_stmm_restore_efivars_generic_ops(void)
>         efivars_generic_ops_register();
>  }
>
> +static const struct efivar_operations tee_efivar_ops = {
> +       .get_variable                   = tee_get_variable,
> +       .get_next_variable              = tee_get_next_variable,
> +       .set_variable                   = tee_set_variable,
> +       .set_variable_nonblocking       = tee_set_variable_nonblocking,
> +       .query_variable_store           = efi_query_variable_store,
> +       .query_variable_info            = tee_query_variable_info,
> +};
> +
>  static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
>  {
>         struct device *dev = &tee_dev->dev;
> @@ -558,13 +566,6 @@ static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
>                           MM_VARIABLE_COMMUNICATE_SIZE +
>                           max_payload_size;
>
> -       tee_efivar_ops.get_variable             = tee_get_variable;
> -       tee_efivar_ops.get_next_variable        = tee_get_next_variable;
> -       tee_efivar_ops.set_variable             = tee_set_variable;
> -       tee_efivar_ops.set_variable_nonblocking = tee_set_variable_nonblocking;
> -       tee_efivar_ops.query_variable_store     = efi_query_variable_store;
> -       tee_efivar_ops.query_variable_info      = tee_query_variable_info;
> -
>         efivars_generic_ops_unregister();
>         pr_info("Using TEE-based EFI runtime variable services\n");
>         efivars_register(&tee_efivars, &tee_efivar_ops);
> --
> 2.51.0
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
