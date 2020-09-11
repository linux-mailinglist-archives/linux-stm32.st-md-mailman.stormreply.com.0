Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE226851C
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Sep 2020 08:48:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0627C3FAE1;
	Mon, 14 Sep 2020 06:48:48 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A888AC3FADD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 19:23:52 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08BJ3lDc140475; Fri, 11 Sep 2020 15:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=3EROlRDCWp8OcJdYHfRi+TO7g3x6mxZvq5GRTKFOd8U=;
 b=KEM/NXHwHPIiTplq1HOhIvX5bAsmw36/0TQu/fZm18VA6D2Zq/anpjXZBRrLmVPOFpmy
 TTxOvSzULmhPdjNJXttCue5U+nbERKLQaVeEVEOnS3oyH0qJ94oxDELU20uLnyTimzz+
 PZxz2lNUjBZ0YpE9/YhEf2c23wjw2VO6eN18JT5ax0/YjI24xVuGFk72HZZpNa0aDy7q
 v2T/0GQBesxj+93SiMLgJLMINVa0ZePtFKARQFWBcmMWHmzb7JzfUKSzU4pTuvFimYEd
 3W8uSHAS5ypVFxtmKSTkM6jA2EYmiJcLYSxMb+ksDBTr7gQ8JOOchFkAQF6mCn7BGq25 NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33gexu0m0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 15:23:03 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08BJ41F3141951;
 Fri, 11 Sep 2020 15:23:02 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33gexu0kys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 15:23:02 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08BJMmTu031168;
 Fri, 11 Sep 2020 19:23:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 33c2a827a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 19:23:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08BJMvdY32768344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Sep 2020 19:22:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C37A5A4040;
 Fri, 11 Sep 2020 19:22:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B845EA4053;
 Fri, 11 Sep 2020 19:22:51 +0000 (GMT)
Received: from sig-9-65-251-51.ibm.com (unknown [9.65.251.51])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Sep 2020 19:22:51 +0000 (GMT)
Message-ID: <46c6f4c1ccab14d914837aa1e4b4ab5674ecc93c.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 David Howells <dhowells@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Stephan Mueller <smueller@chronox.de>, Marcelo Henrique Cerri
 <marcelo.cerri@canonical.com>, "Steven Rostedt (VMware)"
 <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>, Brendan
 Higgins <brendanhiggins@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, Waiman
 Long <longman@redhat.com>, Lakshmi Ramasubramanian
 <nramas@linux.microsoft.com>, Colin Ian King <colin.king@canonical.com>,
 Tushar Sugandhi <tusharsu@linux.microsoft.com>, Vitaly Chikunov
 <vt@altlinux.org>, Gilad Ben-Yossef <gilad@benyossef.com>, Pascal van
 Leeuwen <pvanleeuwen@rambus.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-security-module@vger.kernel.org
Date: Fri, 11 Sep 2020 15:22:50 -0400
In-Reply-To: <20200903131242.128665-9-tianjia.zhang@linux.alibaba.com>
References: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com>
 <20200903131242.128665-9-tianjia.zhang@linux.alibaba.com>
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_09:2020-09-10,
 2020-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1011 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 suspectscore=3 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110148
X-Mailman-Approved-At: Mon, 14 Sep 2020 06:48:48 +0000
Cc: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>
Subject: Re: [Linux-stm32] [PATCH v6 8/8] integrity: Asymmetric digsig
 supports SM2-with-SM3 algorithm
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

On Thu, 2020-09-03 at 21:12 +0800, Tianjia Zhang wrote:
> Asymmetric digsig supports SM2-with-SM3 algorithm combination,
> so that IMA can also verify SM2's signature data.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com> (coding, not crypto
perspective)
> ---
>  security/integrity/digsig_asymmetric.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
> index cfa4127d0518..b86a4a8f61ab 100644
> --- a/security/integrity/digsig_asymmetric.c
> +++ b/security/integrity/digsig_asymmetric.c
> @@ -99,14 +99,22 @@ int asymmetric_verify(struct key *keyring, const char *sig,
>  	memset(&pks, 0, sizeof(pks));
>  
>  	pks.hash_algo = hash_algo_name[hdr->hash_algo];
> -	if (hdr->hash_algo == HASH_ALGO_STREEBOG_256 ||
> -	    hdr->hash_algo == HASH_ALGO_STREEBOG_512) {
> +	switch (hdr->hash_algo) {
> +	case HASH_ALGO_STREEBOG_256:
> +	case HASH_ALGO_STREEBOG_512:
>  		/* EC-RDSA and Streebog should go together. */
>  		pks.pkey_algo = "ecrdsa";
>  		pks.encoding = "raw";
> -	} else {
> +		break;
> +	case HASH_ALGO_SM3_256:
> +		/* SM2 and SM3 should go together. */
> +		pks.pkey_algo = "sm2";
> +		pks.encoding = "raw";
> +		break;
> +	default:
>  		pks.pkey_algo = "rsa";
>  		pks.encoding = "pkcs1";
> +		break;
>  	}
>  	pks.digest = (u8 *)data;
>  	pks.digest_size = datalen;


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
