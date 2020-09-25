Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6442027828C
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Sep 2020 10:20:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F108C3FAFF;
	Fri, 25 Sep 2020 08:20:48 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CFAAC3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 08:20:43 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kLixP-0007SY-SN; Fri, 25 Sep 2020 18:19:57 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 25 Sep 2020 18:19:55 +1000
Date: Fri, 25 Sep 2020 18:19:55 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <20200925081955.GV6381@gondor.apana.org.au>
References: <20200920162103.83197-1-tianjia.zhang@linux.alibaba.com>
 <20200920162103.83197-3-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200920162103.83197-3-tianjia.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Eric Biggers <ebiggers@google.com>, Stephan Mueller <smueller@chronox.de>,
 Brendan Higgins <brendanhiggins@google.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Vitaly Chikunov <vt@altlinux.org>, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
 Waiman Long <longman@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Gilad Ben-Yossef <gilad@benyossef.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Howells <dhowells@redhat.com>,
 Pascal van Leeuwen <pvanleeuwen@rambus.com>, linux-kernel@vger.kernel.org,
 Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH] lib/mpi: Fix unused variable warnings
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

On Mon, Sep 21, 2020 at 12:20:55AM +0800, Tianjia Zhang wrote:
> Expand the mpi library based on libgcrypt, and the ECC algorithm of
> mpi based on libgcrypt requires these functions.
> Some other algorithms will be developed based on mpi ecc, such as SM2.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>

This creates some compiler warnings.

---8<---
This patch removes a number of unused variables and marks others
as unused in order to silence compiler warnings about them.

Fixes: a8ea8bdd9df9 ("lib/mpi: Extend the MPI library")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/lib/mpi/mpi-div.c b/lib/mpi/mpi-div.c
index 21332dab97d4..45beab8b9e9e 100644
--- a/lib/mpi/mpi-div.c
+++ b/lib/mpi/mpi-div.c
@@ -92,7 +92,6 @@ void mpi_tdiv_qr(MPI quot, MPI rem, MPI num, MPI den)
 	unsigned int normalization_steps;
 	mpi_limb_t q_limb;
 	mpi_ptr_t marker[5];
-	unsigned int marker_nlimbs[5];
 	int markidx = 0;
 
 	/* Ensure space is enough for quotient and remainder.
@@ -152,7 +151,6 @@ void mpi_tdiv_qr(MPI quot, MPI rem, MPI num, MPI den)
 		 * numerator would be gradually overwritten by the quotient limbs.
 		 */
 		if (qp == np) { /* Copy NP object to temporary space.  */
-			marker_nlimbs[markidx] = nsize;
 			np = marker[markidx++] = mpi_alloc_limb_space(nsize);
 			MPN_COPY(np, qp, nsize);
 		}
@@ -173,7 +171,6 @@ void mpi_tdiv_qr(MPI quot, MPI rem, MPI num, MPI den)
 		 * the most significant word.  Use temporary storage not to clobber
 		 * the original contents of the denominator.
 		 */
-		marker_nlimbs[markidx] = dsize;
 		tp = marker[markidx++] = mpi_alloc_limb_space(dsize);
 		mpihelp_lshift(tp, dp, dsize, normalization_steps);
 		dp = tp;
@@ -195,7 +192,6 @@ void mpi_tdiv_qr(MPI quot, MPI rem, MPI num, MPI den)
 		if (dp == rp || (quot && (dp == qp))) {
 			mpi_ptr_t tp;
 
-			marker_nlimbs[markidx] = dsize;
 			tp = marker[markidx++] = mpi_alloc_limb_space(dsize);
 			MPN_COPY(tp, dp, dsize);
 			dp = tp;
diff --git a/lib/mpi/mpi-internal.h b/lib/mpi/mpi-internal.h
index d29c4537c3a3..554002182db1 100644
--- a/lib/mpi/mpi-internal.h
+++ b/lib/mpi/mpi-internal.h
@@ -114,7 +114,7 @@ typedef int mpi_size_t;		/* (must be a signed type) */
  */
 #define UDIV_QRNND_PREINV(q, r, nh, nl, d, di)				\
 	do {								\
-		mpi_limb_t _ql;						\
+		mpi_limb_t _ql __maybe_unused;				\
 		mpi_limb_t _q, _r;					\
 		mpi_limb_t _xh, _xl;					\
 		umul_ppmm(_q, _ql, (nh), (di));				\
diff --git a/lib/mpi/mpi-mul.c b/lib/mpi/mpi-mul.c
index 587e6335cc12..8f5fa200f297 100644
--- a/lib/mpi/mpi-mul.c
+++ b/lib/mpi/mpi-mul.c
@@ -21,7 +21,6 @@ void mpi_mul(MPI w, MPI u, MPI v)
 	int usign, vsign, sign_product;
 	int assign_wp = 0;
 	mpi_ptr_t tmp_limb = NULL;
-	unsigned int tmp_limb_nlimbs = 0;
 
 	if (u->nlimbs < v->nlimbs) {
 		/* Swap U and V. */
@@ -55,7 +54,6 @@ void mpi_mul(MPI w, MPI u, MPI v)
 	} else { /* Make U and V not overlap with W.	*/
 		if (wp == up) {
 			/* W and U are identical.  Allocate temporary space for U. */
-			tmp_limb_nlimbs = usize;
 			up = tmp_limb = mpi_alloc_limb_space(usize);
 			/* Is V identical too?  Keep it identical with U.  */
 			if (wp == vp)
@@ -64,7 +62,6 @@ void mpi_mul(MPI w, MPI u, MPI v)
 			MPN_COPY(up, wp, usize);
 		} else if (wp == vp) {
 			/* W and V are identical.  Allocate temporary space for V. */
-			tmp_limb_nlimbs = vsize;
 			vp = tmp_limb = mpi_alloc_limb_space(vsize);
 			/* Copy to the temporary space.  */
 			MPN_COPY(vp, wp, vsize);
diff --git a/lib/mpi/mpih-div.c b/lib/mpi/mpih-div.c
index 182a656a1ba0..be70ee2e42d3 100644
--- a/lib/mpi/mpih-div.c
+++ b/lib/mpi/mpih-div.c
@@ -31,7 +31,7 @@ mpihelp_mod_1(mpi_ptr_t dividend_ptr, mpi_size_t dividend_size,
 {
 	mpi_size_t i;
 	mpi_limb_t n1, n0, r;
-	mpi_limb_t dummy;
+	mpi_limb_t dummy __maybe_unused;
 
 	/* Botch: Should this be handled at all?  Rely on callers?	*/
 	if (!dividend_size)
@@ -382,7 +382,7 @@ mpihelp_divmod_1(mpi_ptr_t quot_ptr,
 {
 	mpi_size_t i;
 	mpi_limb_t n1, n0, r;
-	mpi_limb_t dummy;
+	mpi_limb_t dummy __maybe_unused;
 
 	if (!dividend_size)
 		return 0;
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
