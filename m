Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB96900AB
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 08:03:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E194C6A5F8;
	Thu,  9 Feb 2023 07:03:41 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A3D7C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 20:38:32 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318KYLT4020473; Wed, 8 Feb 2023 20:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2022-7-12; bh=Fz+FHQCR/AArZdbtbzr9TdzXWdNsm9OWfRrg70mi0Uo=;
 b=m1+iCQHfRRTwbCngCib9juE6Unaq7ct9qJV0mIx7xca+mFuk69CzCkbwXLyf7fpUJtNK
 2PNOC9ljai7nBiksO2QxuOyGebkAZ3gvsSlvUBxW34FwvJdv0+9BGmoY65HvJ86jMtpY
 2ReuJNNFvSdNZusOdioX4Bs+xnVhS9LSLD7dkHBfkjtrA04OZUbtuNxSMdRsBlSbWZ2f
 w5sPQIVDOI8/81WWX9JFXwSmo+sBKCkNeoo8OK6dyTRODBv+Z8NL6ox76ZMoqDWHFfs3
 bsnZV/e11T85cSSTtNKWN+MQCAt6hW4ee3SYD7CzNO9gakcf4EWDshcTV5XL9hU9iK7s Mw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe53h8s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 20:37:44 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 318JbTxZ028341; Wed, 8 Feb 2023 20:37:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdte9d1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 20:37:43 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318Kbhrc001108;
 Wed, 8 Feb 2023 20:37:43 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3nhdte9d05-1; Wed, 08 Feb 2023 20:37:42 +0000
From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
To: stable@vger.kernel.org
Date: Wed,  8 Feb 2023 12:37:10 -0800
Message-Id: <20230208203711.951845-1-saeed.mirzamohammadi@oracle.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080175
X-Proofpoint-ORIG-GUID: Fun6MAX0JSxeNnCiIJ9yVVG4PKAyW1kZ
X-Proofpoint-GUID: Fun6MAX0JSxeNnCiIJ9yVVG4PKAyW1kZ
X-Mailman-Approved-At: Thu, 09 Feb 2023 07:03:38 +0000
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Eric Biggers <ebiggers@google.com>, saeed.mirzamohammadi@oracle.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH stable 0/1] crypto: testmgr - don't generate
	WARN for missing modules
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

I'm backporting the following stable patch to v5.11+ branches.

Commit Data:
  commit-id        : a76bd86a85cac9feddc66d38019f943d054f0218
  subject          : crypto: testmgr - don't generate WARN for missing modules
  author           : elliott@hpe.com
  author date      : 2022-08-13 23:14:43
  committer        : herbert@gondor.apana.org.au
  committer date   : 2022-08-19 10:39:39

We observed the same WARN issue when loading the tcrypt module in a v5.15 kernel:

[   84.577572] modprobe tcrypt
[   84.920899] alg: skcipher: failed to allocate transform for ecb(cast5): -2
[   84.923050] ------------[ cut here ]------------
[   84.924541] alg: self-tests for ecb(cast5) (ecb(cast5)) failed (rc=-2)
[   84.924557] WARNING: CPU: 0 PID: 3910 at crypto/testmgr.c:5681 alg_test+0x344/0x5d8

This patch fixes this issue.

Robert Elliott (1):
  crypto: testmgr - don't generate WARN for missing modules

 crypto/testmgr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
